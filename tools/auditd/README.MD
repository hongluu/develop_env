*Một ngày đẹp trời khách hàng yêu cầu hàng tháng phải có report về hoạt động của ssh user trên server. Loay hoay hết mấy hôm google search, cuối cùng tìm được em này, thấy cũng khá ngon , viết lên đây chia sẻ với a/e.*


## Vậy Audit là gì?
Đơn giản để hiểu, auditd là một thằng dịch vụ chạy ngầm (audit deamon) chịu trách nhiệm ghi lại tất cả hoạt động của hệ thống , người dùng ... Theo như google search thì có vẻ audit được tích hợp mặc định trên hầu Linux operating system.
Hầu hết thôi chứ không phải là tất cả, trong trường hợp mình phải tiến hành cài đặt :))
## Cài đặt audit như thế nào?
* Bạn có thể google search với keyword `Installing the Linux Audit System on ...`. Còn nếu không thì có thể tham khảo tại đây (Trong trường hợp này mình dùng Ubuntu Server 18).
    ```
    sudo apt install -y auditd audispd-plugins
    ```

* Các cấu hình sẽ được lưu trong folder `/etc/audit`

* Để thực hiện log hoạt động của tất cả người dùng:
    * Mở file `nano /etc/audit/rules.d/audit.rules`
    * Thêm 2 dòng bên dưới vào cuối file
    ```
    -a exit,always -F arch=b64 -S execve
    -a exit,always -F arch=b32 -S execve
    ```
    * Sau đó restart với lệnh `sudo service auditd restart`
    * Mặc định log sẽ được lưu trữ ở  `/var/log/audit/audit.log`. Hoặc có thể cấu hình trong file /etc/audit/auditd.conf

Ok vậy là cơ bản hệ thống đã được giám sát bởi audit rồi. Giờ chúng ta sẽ tìm hiểu qua cách để sử dụng audit.

## Sử dụng `auditd` như thế nào ?
* 3 tiện ích hay dùng:
    * auditctl – 1 tiện ích để kiểm soát hệ thống kernel audit
    * ausearch – 1 tiện ích cho việc tìm kiếm các audit log với các event đặc biệt.
    * aureport – 1 tiện ích để tạo các báo cáo về sự kiện được ghi lại.
* Các thông số trong logs:
    * `time` - is when the audit is done
    * `name` - is the object name to be audited
    * `cwd` - is the current directory
    * `syscall` - is related syscall
    * `auid` - is the audit user ID
    * `uid` and `gid` -  User ID and Group ID 
    ...
    
* Các lệnh aureport hay dùng:
    * `sudo aureport -au` : Report about authentication attempts
    * `sudo aureport -m`: Report all events related to account modification
    ...
    * Xem thêm tại `sudo man aureport`
* Các lệnh ausearch hay dùng:
    * `ausearch -m USER_AUTH` -  Xem các nội dung liên quan đến authentication
    * `ausearch -m USER_CMD` -  Xem các nội dung liên quan đến lệnh mà user thưc hiện
    ... Xem thêm tại `ausearch -m`
    * `man ausearch this-month` - (today,this-week,this-mounth ...) Xem tất cả các log trong tháng.
    * `man ausearch this-month --file csv > audit.csv` - Export log trong tháng ra file CSV.
    * ... Xem thêm tại `sudo man ausearch`

## Một vài scripts hữu ích nếu cần.