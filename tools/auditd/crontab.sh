#!/bin/bash
crontab -e
@monthly ./export_user_tracking_per_month.sh