import cv2
import numpy as np
import face_recognition
import pymysql
from datetime import datetime, timedelta
import os
import tkinter as tk
from tkinter import Label, Frame, ttk, Scrollbar
from PIL import Image, ImageTk
import dlib


# Check if GPU is available
if dlib.DLIB_USE_CUDA:
    print("GPU is being used")
else:
    print("GPU is not available. Falling back to CPU")


try:
    db = pymysql.connect(
        host="localhost",
        user="root",
        password="",
        database="slsubits_db"
    )
    print("Database connection successful.")
except Exception as e:
    print(f"Database connection failed: {e}")


cursor = db.cursor()


# Initialize webcam (for laptop camera)
video_capture = cv2.VideoCapture(0)
if not video_capture.isOpened():
    print("Error: Could not access the webcam.")
else:
    print("Webcam successfully accessed. Press 'q' to quit.")


# Load registered face encodings and user IDs from the database
def load_registered_faces():
    known_face_encodings = []
    known_face_ids = []
    cursor.execute("SELECT id, user_id, captured_image FROM biometrics")
    results = cursor.fetchall()
    for row in results:
        user_id = row[1]
        img_path = row[2]
        img_path = os.path.join("public", img_path)
        if os.path.exists(img_path):
            image = face_recognition.load_image_file(img_path)
            face_encodings = face_recognition.face_encodings(image)
            if face_encodings:
                known_face_encodings.append(face_encodings[0])
                known_face_ids.append(user_id)
            else:
                print(f"Error: No face encodings found for image at {img_path}")
        else:
            print(f"Error: Image path {img_path} does not exist")
    return known_face_encodings, known_face_ids


def get_user_name(user_id):
    cursor.execute("SELECT name FROM users WHERE id = %s", (user_id,))
    result = cursor.fetchone()
    return result[0] if result else "Unknown"


def get_user_type(user_id):
    cursor.execute("SELECT type FROM users WHERE id = %s", (user_id,))
    result = cursor.fetchone()
    return result[0] if result else "Unknown"


def save_notification(title, message):
    try:
        cursor.execute(
            "INSERT INTO notifications (title, message) VALUES (%s, %s)",
            (title, message)
        )
        db.commit()
        print("Notification saved.")
    except Exception as e:
        print(f"Failed to save notification: {e}")


def save_unknown_user_face(frame, top, right, bottom, left):
    face_image = frame[top:bottom, left:right]
    unknown_user_path = os.path.join("public", "unregister_user")
    os.makedirs(unknown_user_path, exist_ok=True)
    timestamp = datetime.now().strftime("%Y%m%d%H%M%S")
    file_path = os.path.join(unknown_user_path, f"unknown_user_{timestamp}.jpg")
    cv2.imwrite(file_path, face_image)
    return file_path


# Tkinter window setup
window = tk.Tk()
window.title("Real-Time Monitoring System")
window.geometry("1200x800")
window.configure(bg="#f5f5f5")


window.grid_columnconfigure(0, weight=1)
window.grid_columnconfigure(1, weight=2)
window.grid_rowconfigure(1, weight=1)


title_label = Label(
    window,
    text="LogBook Monitoring System",
    font=("Helvetica", 24, "bold"),
    bg="#3f51b5",
    fg="#ffffff",
    padx=20,
    pady=10
)
title_label.grid(row=0, column=0, columnspan=2, sticky="ew")


left_frame = Frame(window, bg="#ffffff", bd=2, relief=tk.SOLID)
left_frame.grid(row=1, column=0, padx=20, pady=20, sticky="nsew")


left_frame.grid_rowconfigure(0, weight=1)
left_frame.grid_columnconfigure(0, weight=1)


video_frame = Label(left_frame, bg="#d9e3f0", text="Video Feed", font=("Helvetica", 14))
video_frame.grid(row=0, column=0, padx=10, pady=10, sticky="nsew")


user_details_frame = Frame(left_frame, bg="#f5f5f5")
user_details_frame.grid(row=1, column=0, padx=10, pady=10, sticky="ew")


Label(user_details_frame, text="Name: ", font=("Helvetica", 14), bg="#f5f5f5").grid(row=0, column=0, sticky="w", padx=5, pady=5)
label_name = Label(user_details_frame, text="--", font=("Helvetica", 14), bg="#f5f5f5", fg="#000000")
label_name.grid(row=0, column=1, sticky="w")


Label(user_details_frame, text="User ID: ", font=("Helvetica", 14), bg="#f5f5f5").grid(row=1, column=0, sticky="w", padx=5, pady=5)
label_user_id = Label(user_details_frame, text="--", font=("Helvetica", 14), bg="#f5f5f5", fg="#000000")
label_user_id.grid(row=1, column=1, sticky="w")


Label(user_details_frame, text="Type: ", font=("Helvetica", 14), bg="#f5f5f5").grid(row=2, column=0, sticky="w", padx=5, pady=5)
label_type = Label(user_details_frame, text="--", font=("Helvetica", 14), bg="#f5f5f5", fg="#000000")
label_type.grid(row=2, column=1, sticky="w")


right_frame = Frame(window, bg="#ffffff", bd=2, relief=tk.SOLID)
right_frame.grid(row=1, column=1, padx=20, pady=20, sticky="nsew")


date_time_label = Label(right_frame, text="Date & Time", font=("Helvetica", 16), bg="#3f51b5", fg="#ffffff", padx=10)
date_time_label.grid(row=0, column=0, sticky="ew", pady=(0, 10))


log_table_frame = Frame(right_frame, bg="#ffffff")
log_table_frame.grid(row=1, column=0, padx=10, pady=10, sticky="nsew")


right_frame.grid_rowconfigure(1, weight=1)
right_frame.grid_columnconfigure(0, weight=1)


columns = ("Name", "Role","Room", "Log Time")
log_table = ttk.Treeview(log_table_frame, columns=columns, show="headings", selectmode="browse")
log_table.pack(side="left", fill="both", expand=True)


scrollbar = Scrollbar(log_table_frame, orient="vertical", command=log_table.yview)
scrollbar.pack(side="right", fill="y")
log_table.configure(yscroll=scrollbar.set)


for col in columns:
    log_table.heading(col, text=col, anchor="center")
    log_table.column(col, anchor="center", width=120)


def resize_video_feed():
    frame_width = video_frame.winfo_width()
    frame_height = video_frame.winfo_height()
    return (frame_width, frame_height)


def update_time():
    date_time_label.config(text=datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
    window.after(1000, update_time)


update_time()


def fetch_logs():
    cursor.execute("SELECT u.name, u.type,a.room, a.log_time FROM logs a JOIN users u ON a.user_id = u.id ORDER BY a.log_time DESC")
    return cursor.fetchall()


def populate_logs():
    log_table.delete(*log_table.get_children())
    for log in fetch_logs():
        log_table.insert("", "end", values=log)


populate_logs()


known_face_encodings, known_face_ids = load_registered_faces()


cooldown_period = timedelta(minutes=1)
entry_state = {}
last_action_timestamps = {}


def process_frame():
    ret, frame = video_capture.read()
    label_name.config(text="")
    label_user_id.config(text="")
    label_type.config(text="")


    if ret:
        face_locations = face_recognition.face_locations(frame, model="hog")
        face_encodings = face_recognition.face_encodings(frame, face_locations)


        for (top, right, bottom, left), face_encoding in zip(face_locations, face_encodings):
            matches = face_recognition.compare_faces(known_face_encodings, face_encoding)
            face_distances = face_recognition.face_distance(known_face_encodings, face_encoding)
            best_match_index = np.argmin(face_distances)


            if matches[best_match_index] and face_distances[best_match_index] < 0.6:
                user_id = known_face_ids[best_match_index]
                name = get_user_name(user_id)
                user_type = get_user_type(user_id)


                color = (0, 255, 0)
                cv2.rectangle(frame, (left, top), (right, bottom), color, 2)
                cv2.putText(frame, f"{name}, {user_type}", (left, top - 10), cv2.FONT_HERSHEY_SIMPLEX, 1, color, 2)


                label_name.config(text=f"{name}")
                label_user_id.config(text=f" {user_id}")
                label_type.config(text=f" {user_type}")


                populate_logs()


                current_time = datetime.now()
                if entry_state.get(user_id, "outside") == "outside":
                    if user_id not in last_action_timestamps or current_time - last_action_timestamps[user_id] > cooldown_period:
                        entry_state[user_id] = "inside"
                        log_time = current_time
                        cursor.execute(
                            "INSERT INTO logs (user_id, log_type, room, log_time) VALUES (%s, %s, %s, %s)",
                            (user_id, "entry", "Computer Laboratory 3", log_time)
                        )
                        db.commit()
                        last_action_timestamps[user_id] = log_time
                else:
                    if user_id not in last_action_timestamps or current_time - last_action_timestamps[user_id] > cooldown_period:
                        entry_state[user_id] = "outside"
                        exit_time = current_time
                        cursor.execute(
                            "INSERT INTO logs (user_id, log_type, room, log_time) VALUES (%s, %s, %s, %s)",
                            (user_id, "exit", "Computer Laboratory 3", exit_time)
                        )
                        db.commit()
                        last_action_timestamps[user_id] = exit_time
            else:
                color = (0, 0, 255)
                cv2.rectangle(frame, (left, top), (right, bottom), color, 2)
                unknown_path = save_unknown_user_face(frame, top, right, bottom, left)
                save_notification("Unknown User", f"Unknown user face saved at {unknown_path}")


        frame_rgb = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
        image = Image.fromarray(frame_rgb).resize((640, 480))
        photo = ImageTk.PhotoImage(image)
        video_frame.config(image=photo)
        video_frame.image = photo


    window.after(10, process_frame)


process_frame()
window.mainloop()



