-- List all events along with their organizers' names and contact details.
SELECT 
    e.event_name, 
    e.event_date, 
    e.event_location, 
    o.organizer_name, 
    o.organizer_contact
FROM 
    Events e
INNER JOIN 
    Organizers o ON e.event_id = o.organizer_id;

-- Count the number of attendees registered for each event.
SELECT 
    e.event_name, 
    COUNT(a.attendee_id) AS num_attendees
FROM 
    Events e
LEFT JOIN 
    Attendees a ON e.event_id = a.event_id
GROUP BY 
    e.event_name;

-- Find the event with the highest number of registrations.
SELECT 
    e.event_name, 
    COUNT(r.registration_id) AS num_registrations
FROM 
    Events e
LEFT JOIN 
    Attendees a ON e.event_id = a.event_id
LEFT JOIN 
    Registrations r ON a.attendee_id = r.attendee_id
GROUP BY 
    e.event_name
ORDER BY 
    num_registrations DESC
LIMIT 1;

-- List all events with their available resources and their capacity.
SELECT 
    e.event_name, 
    r.resource_name, 
    r.resource_capacity
FROM 
    Events e
CROSS JOIN 
    Resources r;

-- Retrieve all events that have a 'Confirmed' registration status.
SELECT 
    e.event_name, 
    r.registration_date, 
    r.registration_status
FROM 
    Events e
INNER JOIN 
    Attendees a ON e.event_id = a.event_id
INNER JOIN 
    Registrations r ON a.attendee_id = r.attendee_id
WHERE 
    r.registration_status = 'Confirmed';

-- Count the total number of events.
SELECT COUNT(*) AS total_events FROM Events;

-- Calculate the average capacity of resources available for each event.
SELECT 
    e.event_name, 
    AVG(r.resource_capacity) AS avg_resource_capacity
FROM 
    Events e
INNER JOIN 
    Resources r ON e.event_location = r.resource_name
GROUP BY 
    e.event_name;

-- Find the event with the earliest date and the one with the latest date.
SELECT 
    MIN(event_date) AS earliest_event_date,
    MAX(event_date) AS latest_event_date
FROM 
    Events;

-- List all events with their respective attendee count and order them by the number of attendees in descending order.
SELECT 
    e.event_name, 
    COUNT(a.attendee_id) AS num_attendees
FROM 
    Events e
LEFT JOIN 
    Attendees a ON e.event_id = a.event_id
GROUP BY 
    e.event_name
ORDER BY 
    num_attendees DESC;

-- Retrieve all events along with their organizers' names, ordered by the event date in ascending order.
SELECT 
    e.event_name, 
    e.event_date, 
    o.organizer_name
FROM 
    Events e
INNER JOIN 
    Organizers o ON e.event_id = o.organizer_id
ORDER BY 
    e.event_date ASC;

-- List the resources that have not been assigned to any event.
SELECT 
    r.resource_name
FROM 
    Resources r
LEFT JOIN 
    Events e ON r.resource_name = e.event_location
WHERE 
    e.event_id IS NULL;

-- Find the event with the most pending registrations.
SELECT 
    e.event_name, 
    COUNT(r.registration_id) AS num_pending_registrations
FROM 
    Events e
LEFT JOIN 
    Attendees a ON e.event_id = a.event_id
LEFT JOIN 
    Registrations r ON a.attendee_id = r.attendee_id
WHERE 
    r.registration_status = 'Pending'
GROUP BY 
    e.event_name
ORDER BY 
    num_pending_registrations DESC
LIMIT 1;

