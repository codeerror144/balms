<?php


namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Notification extends Model
{
    use HasFactory;

    // Define the table if it's not using the default table name 'notifications'
    // protected $table = 'your_table_name';

    // Specify the fillable columns for mass assignment
    protected $fillable = [
        'title',
        'message',
        'status', // Status can be 'unread' or 'read'
        'user_id', // Assuming notifications belong to a user (if applicable)
    ];

    // You can define the status as a constant for easier comparison
    const STATUS_UNREAD = 'unread';
    const STATUS_READ = 'read';

    // Define relationships (if notifications belong to a user, for example)
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    // Add any other custom methods you may need, such as for marking as read
    public function markAsRead()
    {
        $this->status = self::STATUS_READ;
        $this->save();
    }

    public function markAsUnread()
    {
        $this->status = self::STATUS_UNREAD;
        $this->save();
    }

}
