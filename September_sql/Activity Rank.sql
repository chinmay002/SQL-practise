select from_user,count(day) as total_emails,ROW_NUMBER() OVER(ORDER BY count(*) DESC, from_user ASC) from google_gmail_emails
group by 1
