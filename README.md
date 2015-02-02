# monitor

一些监控或守护进程的小脚本

一、monitor_phpcgi.sh 
监控php-cgi port的进程，挂了则重新调起，每2秒检测一次。
使用示例：nohup monitor_phpcgi.sh 8001&


