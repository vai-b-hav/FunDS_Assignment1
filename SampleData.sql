USE assingment_2;

TRUNCATE TABLE salary;
TRUNCATE TABLE feedback;


INSERT INTO salary(basic, perks,tax) VALUES
	  (5000,500,7)
    , (60000,2700,14)
    , (8000,700,7)
    , (10000,600, NULL)
    , (12000,800,7)
    , (32000,1500,10)
    , (80000,0, NULL);


INSERT INTO feedback VALUES
	  ('Fundamentals of Data Base Systems',5,'Interesting course')
    , ('Fundamentals of Data Base Systems',4,'Loved it!')
    , ('SSD',5,'Insightful')
    , ('CDS',5,'The best course')
    , ('Inference',5,'Thought provoking subject')
    , ('SPA',5,'Most interesting subject ever')
    , ('SPA',5,'Most interesting subject ever')
    , ('Fundamentals of Data Base Systems',4,'Loved it!');