# -*- coding: utf-8 -*-
__author__ = 'aditya'
import flask.json
import smtplib
import os
from email.mime.application import MIMEApplication
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
import mimetypes
from email.mime.image import MIMEImage
from email.mime.audio import MIMEAudio
from email.mime.base import MIMEBase


class SendEmail():

    def create_message(self, sender, to, subject, msg_html, msg_plain):
        msg = MIMEMultipart()
        msg['Subject'] = subject
        msg['From'] = sender
        # Record the MI        ME types of both parts - text/plain and text/html.
        part1 = MIMEText(msg_plain, 'plain')
        part2 = MIMEText(msg_html, 'html')
        # Attach parts into message container.
        # According to RFC 2046, the last part of a multipart message, in this case
        # the HTML message, is best and preferred.
        msg.attach(part1)
        msg.attach(part2)
        msg['To'] = to
        # msg = MIMEMultipart()
        # msg['Subject'] = subject
        # msg['From'] = sender
        # msg['To'] = to
        # msg.attach(MIMEText(msg_plain, 'plain'))
        # msg.attach(MIMEText(msg_html, 'html'))
        return msg.as_string()

    def create_message_with_attachment(self, sender, to, subject, msg_html, msg_plain, attachment_file):

        """Create a message for an email.
        Args:
        sender: Email address of the sender.
        to: Email address of the receiver.
        subject: The subject of the email message.
        msg_html: Html message to be sent
        msg_plain: Alternative plain text message for older email clients
        attachment_file: The path to the file to be attached.

        Returns:
        An object containing a base64url encoded email object.
        """
        message = MIMEMultipart('mixed')
        message['to'] = to
        message['from'] = sender
        message['subject'] = subject
        messageA = MIMEMultipart('alternative')
        messageR = MIMEMultipart('related')
        messageR.attach(MIMEText(msg_html, 'html'))
        messageA.attach(MIMEText(msg_plain, 'plain'))
        messageA.attach(messageR)
        message.attach(messageA)
        print("create_message_with_attachment: file:", attachment_file)
        content_type, encoding = mimetypes.guess_type(attachment_file)
        if content_type is None or encoding is not None:
            content_type = 'application/octet-stream'
        main_type, sub_type = content_type.split('/', 1)
        if main_type == 'text':
            fp = open(attachment_file, 'rb')
            msg = MIMEText(fp.read(), _subtype=sub_type)
            fp.close()
        elif main_type == 'image':
            fp = open(attachment_file, 'rb')
            msg = MIMEImage(fp.read(), _subtype=sub_type)
            fp.close()
        elif main_type == 'audio':
            fp = open(attachment_file, 'rb')
            msg = MIMEAudio(fp.read(), _subtype=sub_type)
            fp.close()
        else:
            fp = open(attachment_file, 'rb')
            msg = MIMEBase(main_type, sub_type)
            msg.set_payload(fp.read())
            fp.close()
        filename = os.path.basename(attachment_file)
        msg.add_header('Content-Disposition', 'attachment', filename=filename)
        message.attach(msg)
        return message.as_string()

    def send_email(self, sender, to, subject, sender_pwd, msg_html, msg_plain, attachment_file):
        # print(sender, to, subject, sender_pwd, msg_html, msg_plain, attachment_file)
        server = smtplib.SMTP('smtp.gmail.com', 587)
        server.ehlo()
        server.starttls()
        server.login(sender, sender_pwd)
        if attachment_file:
            message = self.create_message_with_attachment(sender, to, subject, msg_html, msg_plain, attachment_file)
        else:
            message = self.create_message(sender, to, subject, msg_html, msg_plain)
        response = server.sendmail(sender, to, message)
        server.quit()
        return response

# class SendEmail():
#     def send_email(self):
#         gmail_user = "thetravelsquareb2b@gmail.com"
#         gmail_pwd = ""
#         html = """\
#
#                """
#         server = smtplib.SMTP('smtp.gmail.com', 587)
#         server.ehlo()
#         server.starttls()
#         server.login(gmail_user, gmail_pwd)
#         msg = MIMEMultipart()
#         msg['Subject'] = "test mail"
#         msg['From'] = gmail_user
#         text = '''Dear , ''' + '''vibhu'''
#         # Record the MIME types of both parts - text/plain and text/html.
#         part1 = MIMEText(text, 'plain')
#         part2 = MIMEText(html, 'html')
#         # Attach parts into message container.
#         # According to RFC 2046, the last part of a multipart message, in this case
#         # the HTML message, is best and preferred.
#         msg.attach(part1)
#         msg.attach(part2)
#         msg['To'] = "aditya.sharma263@gmail.com"
#         response = server.sendmail(gmail_user, "aditya.sharma263@gmail.com", msg.as_string())
#         server.quit()
#         return response
