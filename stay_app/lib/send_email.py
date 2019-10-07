# -*- coding: utf-8 -*-
__author__ = 'aditya'
import flask.json
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.mime.application import MIMEApplication


class SendEmail():
    def send_email(self):
        result = {}
        gmail_user = "sharmaabhi069.as@gmail.com"
        gmail_pwd = "9891808371"
        # html = """\
        #       <html>
        #           <head></head>
        #           <body>
        #           <h1>hellloooo</h1>
        #           </body>
        #       </html>
        #       """
        server = smtplib.SMTP('smtp.gmail.com', 587)
        server.ehlo()
        server.starttls()
        server.login(gmail_user, gmail_pwd)
        msg = MIMEMultipart()
        msg['Subject'] = "Volunteer assigned for pickup"
        msg['From'] = gmail_user
        text = '''Dear ,''' + str(result["name"]) + '''hunger relief is thankful for your support.
                Millions of our fellow beings are dying in hunger while millions of tons of food is being wasted, thrown away and discarded.
                with support of each other we can ensure no one goes to sleep empty stomach
                this is the great way to serve humanity
                We are thankfull for your donation  contact no of our volunteer is''' + str(result["contact_no"])
        part1 = MIMEText(text, 'plain')
        msg.attach(part1)
        # msg.attach(part2)
        msg['To'] = str(result["res_email"])
        server.sendmail(gmail_user, str(result["res_email"]), msg.as_string())
        server.quit()