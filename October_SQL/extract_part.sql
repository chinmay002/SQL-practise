select count(extract(Month from date_approved)) as n_approved from facebook_friendship_requests
where extract(Month from date_approved) in (1,2)
