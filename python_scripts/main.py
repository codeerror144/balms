import tkinter as tk
from tkinter import messagebox
from datetime import datetime
import mysql.connector
import subprocess
import os


# Database connection configuration
db_config = {
    "host": "localhost",
    "user": "root",
    "password": "",
    "database": "slsubits_db"
}


# Function to update the time display
def update_time():
    now = datetime.now().strftime("%I:%M:%S %p")  # 12-hour format with AM/PM
    time_label.config(text=now)
    root.after(1000, update_time)


# Function to query the database and update the dashboard stats
def update_dashboard():
    try:
        connection = mysql.connector.connect(**db_config)
        cursor = connection.cursor()


        # Users logged in today
        today = datetime.now().strftime("%Y-%m-%d")
        query_today = f"SELECT COUNT(DISTINCT user_id) FROM attendances WHERE DATE(login_time) = '{today}'"
        cursor.execute(query_today)
        users_logged_today = cursor.fetchone()[0]


        # Recent entries
        query_recent = f"SELECT COUNT(*) FROM attendances WHERE login_time >= NOW() - INTERVAL 1 DAY"
        cursor.execute(query_recent)
        recent_entries = cursor.fetchone()[0]


        # Active users
        query_active = f"SELECT COUNT(*) FROM attendances WHERE logout_time IS NULL"
        cursor.execute(query_active)
        active_users = cursor.fetchone()[0]


        # Update labels
        users_logged_label.config(text=f"Users Logged In Today: {users_logged_today}")
        recent_entries_label.config(text=f"Recent Entries: {recent_entries}")
        active_users_label.config(text=f"Active Users: {active_users}")


        cursor.close()
        connection.close()


    except mysql.connector.Error as err:
        messagebox.showerror("Database Error", f"Error: {err}")


    root.after(60000, update_dashboard)


# Function to run the facial recognition script
def run_facial_recognition():
    try:
        subprocess.run(["python", os.path.join("python_scripts", "facial_recognition.py")])
    except Exception as e:
        messagebox.showerror("Error", f"Failed to run facial recognition: {e}")


# Function to run the employee attendance script
def run_employee_attendance():
    try:
        subprocess.run(["python", os.path.join("python_scripts", "attendance.py")])
    except Exception as e:
        messagebox.showerror("Error", f"Failed to run employee attendance: {e}")


# Function to move the header text
def move_text():
    current_x = canvas.coords(header_text)[0]
    new_x = current_x - 5  # Move the text 5 pixels to the left
    if new_x < -canvas.bbox(header_text)[2]:  # If the text has moved off the canvas
        new_x = canvas.winfo_width()  # Reset to the right side of the canvas
    canvas.coords(header_text, new_x, 20)
    root.after(50, move_text)  # Call the function again after 50ms


# Main GUI window
def start_main_application():
    global root, time_label, users_logged_label, recent_entries_label, active_users_label, canvas, header_text
    root = tk.Tk()
    root.title("Attendance Monitoring System")


    # Set window size and background color
    root.geometry("900x600")
    root.configure(bg="#f5f5f5")


    # Create a canvas to hold the scrolling header text
    canvas = tk.Canvas(root, bg="#3f51b5", height=50, width=100)
    canvas.pack(fill=tk.X)


    # Header (scrolling text)
    header_text = canvas.create_text(900, 20, text="Real Time Monitoring System", font=("Arial", 24, "bold"), fill="white")
   
    # Start moving the header text
    move_text()


    # Time Display (Modern and responsive design)
    time_label = tk.Label(root, text="", font=("Arial", 48, "bold"), bg="#f5f5f5", fg="#3f51b5", pady=10)
    time_label.pack(pady=(20, 10))
    update_time()
   
   


    # Dashboard Frame
    dashboard_frame = tk.Frame(root, bg="#f5f5f5", pady=20)
    dashboard_frame.pack(fill=tk.BOTH, expand=True)


    # Stats Boxes with rounded corners and shadows
    stats_box_style = {
        "font": ("Arial", 18),
        "fg": "white",
        "bd": 2,
        "relief": "solid",
        "width": 30,
        "height": 4,
        "padx": 20,
        "pady": 15,
        "bg": "#3f51b5"
    }


    users_logged_label = tk.Label(dashboard_frame, text="Users Logged In Today: 0", **stats_box_style)
    users_logged_label.grid(row=0, column=0, padx=20, pady=10, sticky="nsew")


    recent_entries_label = tk.Label(dashboard_frame, text="Recent Entries: 0", **stats_box_style)
    recent_entries_label.grid(row=0, column=1, padx=20, pady=10, sticky="nsew")


    active_users_label = tk.Label(dashboard_frame, text="Active Users: 0", **stats_box_style)
    active_users_label.grid(row=0, column=2, padx=20, pady=10, sticky="nsew")


    update_dashboard()


    # Buttons Frame
    buttons_frame = tk.Frame(root, bg="#f5f5f5", pady=20)
    buttons_frame.pack()


    facial_recognition_button = tk.Button(buttons_frame, text="LogBook Monitoring", font=("Arial", 16), bg="#3f51b5", fg="white", padx=20, pady=10, relief="flat", bd=0, command=run_facial_recognition)
    facial_recognition_button.grid(row=0, column=0, padx=20, pady=10)


    employee_attendance_button = tk.Button(buttons_frame, text="Employee Attendance", font=("Arial", 16), bg="#3f51b5", fg="white", padx=20, pady=10, relief="flat", bd=0, command=run_employee_attendance)
    employee_attendance_button.grid(row=0, column=1, padx=20, pady=10)


    # Configure grid weights for responsiveness
    dashboard_frame.grid_columnconfigure(0, weight=1)
    dashboard_frame.grid_columnconfigure(1, weight=1)
    dashboard_frame.grid_columnconfigure(2, weight=1)


    # Main loop
    root.mainloop()


# Run the main application
if __name__ == "__main__":
    start_main_application()





