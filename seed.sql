DROP TABLE IF EXISTS books_genres;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS authors, genres;

CREATE TABLE authors (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) DEFAULT NULL 
);

CREATE TABLE genres (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) DEFAULT NULL 
);

CREATE TABLE books (
  id SERIAL PRIMARY KEY,
  authorId INTEGER REFERENCES authors(id) NOT NULL, 
  title VARCHAR(500) DEFAULT NULL,
  summary TEXT DEFAULT NULL,
  dateFinished DATE DEFAULT now(),
  rating INTEGER DEFAULT 0
);

CREATE TABLE books_genres (
    bookId INTEGER REFERENCES books(id) NOT NULL,
    genreId INTEGER REFERENCES genres(id) NULL NULL 
);

INSERT INTO authors (name) VALUES ('George M. Johnson');
INSERT INTO authors (name) VALUES ('Eyal Press');
INSERT INTO authors (name) VALUES ('Naoko Wake');
INSERT INTO authors (name) VALUES ('Brian Malloy');
INSERT INTO authors (name) VALUES ('Amelia Pang');
INSERT INTO authors (name) VALUES ('Juhea Kim');
INSERT INTO authors (name) VALUES ('Jung Yun');
INSERT INTO authors (name) VALUES ('Anna Abney');
INSERT INTO authors (name) VALUES ('Sarah Waters');

INSERT INTO genres (name) VALUES ('Non-Fiction');
INSERT INTO genres (name) VALUES ('Politics');
INSERT INTO genres (name) VALUES ('Memoir');
INSERT INTO genres (name) VALUES ('History');
INSERT INTO genres (name) VALUES ('Historical Fiction');
INSERT INTO genres (name) VALUES ('Contemporary Fiction');

INSERT INTO books (authorId, title,  summary, dateFinished, rating) VALUES ((SELECT id from authors where name='George M. Johnson'), 'All Boys Arent Blue', 'In a series of personal essays, prominent journalist and LGBTQIA+ activist George M. Johnson explores his childhood, adolescence, and college years in New Jersey and Virginia. From the memories of getting his teeth kicked out by bullies at age five, to flea marketing with his loving grandmother, to his first sexual relationships, this young-adult memoir weaves together the trials and triumphs faced by Black queer boys. 
    
Both a primer for teens eager to be allies as well as a reassuring testimony for young queer men of color, All Boys Aren''t Blue covers topics such as gender identity, toxic masculinity, brotherhood, family, structural marginalization, consent, and Black joy. Johnson''s emotionally frank style of writing will appeal directly to young adults.', '2021-08-02', 4);
INSERT INTO books (authorId, title, summary, dateFinished, rating) VALUES ((SELECT id from authors where name='Eyal Press'), 'Dirty Work: Essential Jobs and the Hidden Toll of Inequality in America', '
A groundbreaking, urgent report from the front lines of dirty work--the work that society considers essential but morally compromised. Drone pilots who carry out targeted assassinations. Undocumented immigrants who man the ''kill floors'' of industrial slaughterhouses. Guards who patrol the wards of America''s most violent and abusive prisons. In Dirty Work, Eyal Press offers a paradigm-shifting view of the moral landscape of contemporary America through the stories of people who perform society''s most ethically troubling jobs. As Press shows, we are increasingly shielded and distanced from an array of morally questionable activities that other, less privileged people perform in our name.

The COVID-19 pandemic has drawn unprecedented attention to the issue of "essential workers," and to the health and safety risks to which workers in prisons and slaughterhouses are exposed. But Dirty Work examines another, less familiar set of occupational hazards: psychological and emotional hardships such as stigma, shame, PTSD, and moral injury. These burdens fall disproportionately on low-income workers, undocumented immigrants, women, and people of color.

Illuminating the moving, at times harrowing stories of the people doing society''s dirty work, and incisively examining the structures of power and complicity that shape their lives, Press reveals fundamental truths about the moral dimensions of work, and the hidden costs of inequality in America.', '2021-08-23', 5);
INSERT INTO books (authorId, title, summary, dateFinished, rating) VALUES ((SELECT id from authors where name='Naoko Wake'), 'American Survivors: Trans-Pacific Memories of Hiroshima and Nagasaki', 'American Survivors is a fresh and moving historical account of U.S. survivors of the Hiroshima and Nagasaki atomic bombings, breaking new ground not only in the study of World War II but also in the public understanding of nuclear weaponry. A truly trans-Pacific history, American Survivors challenges the dualistic distinction between Americans-as-victors and Japanese-as-victims often assumed by scholars of the nuclear war. Using more than 130 oral histories of Japanese American and Korean American survivors, their family members, community activists, and physicians - most of which appear here for the first time - Naoko Wake reveals a cross-national history of war, illness, immigration, gender, family, and community from intimately personal perspectives. American Survivors brings to light the history of Hiroshima and Nagasaki that connects, as much as separates, people across time and national boundaries.', '2021-06-09', 4);
INSERT INTO books (authorId, title, summary, dateFinished, rating) VALUES ((SELECT id from authors where name='Brian Malloy'), 'After Francesco', 'Return to New York City and Minneapolis in 1988, at the peak of the AIDS crisis, in this stunning novel of relationships and surviving heartbreaking loss. Published on the 40th anniversary of the disease''s first reported cases, this story is both a tribute to a generation lost to the pandemic as well as a powerful exploration of heartbreak, recovery, and how love can defy grief.

Two years after his partner, Francesco, died, twenty-eight-year-old Kevin Doyle is dusting off his one good suit jacket for yet another funeral, yet another loss in their close-knit group. They had all been young, beautiful, and living the best days of their lives, though they didn’t know it. That was before New York City began to feel like a war zone, its horrors somehow invisible, and ignored by the rest of the world.

Some people might insist that Francesco is in a better place now, but Kevin definitely isn’t. He spends his days in a mind-numbing job and his evenings drunk in Francesco’s old apartment, surrounded by memories. Francesco made everything look easy, and without him, Kevin struggles to keep going. And then one night, he stops trying. When Kevin awakens in a hospital, he knows it’s time to move back home to Minnesota and figure out how to start living again—without Francesco.

With the help of a surviving partners support group and old and new friends, Kevin slowly starts to do just that. But an unthinkable family betrayal, and the news that his best friend is fighting for his life in New York, will force a reckoning and a defining choice.

Drawing on his experience as part of the AIDS generation, Brian Malloy brings authenticity, insight, sensitivity, and humor to a story that is distinct yet universal in its powerful exploration of heartbreak and recovery, and the ways in which love can defy grief.', '2021-06-01', 4);
INSERT INTO books (authorId, title, summary, dateFinished, rating) VALUES ((SELECT id from authors where name='Amelia Pang'), 'Made in China: A Prisoner, an SOS Letter, and the Hidden Cost of America''s Cheap Goods','In 2012, an Oregon mother named Julie Keith opened up a package of Halloween decorations. The cheap foam headstones had been five dollars at Kmart, too good a deal to pass up. But when she opened the box, something shocking fell out: an SOS letter, handwritten in broken English.
    
"Sir: If you occassionally buy this product, please kindly resend this letter to the World Human Right Organization. Thousands people here who are under the persicuton of the Chinese Communist Party Government will thank and remember you forever."

The note’s author, Sun Yi, was a mild-mannered Chinese engineer turned political prisoner, forced into grueling labor for campaigning for the freedom to join a forbidden meditation movement. He was imprisoned alongside petty criminals, civil rights activists, and tens of thousands of others the Chinese government had decided to "reeducate," carving foam gravestones and stitching clothing for more than fifteen hours a day.

In Made in China, investigative journalist Amelia Pang pulls back the curtain on Sun''s story and the stories of others like him, including the persecuted Uyghur minority group whose abuse and exploitation is rapidly gathering steam. What she reveals is a closely guarded network of laogai—forced labor camps—that power the rapid pace of American consumerism. Through extensive interviews and firsthand reportage, Pang shows us the true cost of America’s cheap goods and shares what is ultimately a call to action—urging us to ask more questions and demand more answers from the companies we patronize.', '2021-06-08', 4);
INSERT INTO books (authorId, title, summary, dateFinished, rating) VALUES ((SELECT id from authors where name='Juhea Kim'), 'Beasts of a Little Land', 'An epic story of love, war, and redemption set against the backdrop of the Korean independence movement, following the intertwined fates of a young girl sold to a courtesan school and the penniless son of a hunter

In 1917, deep in the snowy mountains of occupied Korea, an impoverished local hunter on the brink of starvation saves a young Japanese officer from an attacking tiger. In an instant, their fates are connected—and from this encounter unfolds a saga that spans half a century.

In the aftermath, a young girl named Jade is sold by her family to Miss Silver’s courtesan school, an act of desperation that will cement her place in the lowest social status. When she befriends an orphan boy named JungHo, who scrapes together a living begging on the streets of Seoul, they form a deep friendship. As they come of age, JungHo is swept up in the revolutionary fight for independence, and Jade becomes a sought-after performer with a new romantic prospect of noble birth. Soon Jade must decide whether she will risk everything for the one who would do the same for her.

From the perfumed chambers of a courtesan school in Pyongyang to the glamorous cafes of a modernizing Seoul and the boreal forests of Manchuria, where battles rage, Juhea Kim’s unforgettable characters forge their own destinies as they wager their nation’s. Immersive and elegant, Beasts of a Little Land unveils a world where friends become enemies, enemies become saviors, heroes are persecuted, and beasts take many shapes.
', '2021-04-19', 5);
INSERT INTO books (authorId, title, summary, dateFinished, rating) VALUES ((SELECT id from authors where name='Jung Yun'), 'O Beautiful', 'From the critically acclaimed author of Shelter, an unflinching portrayal of a woman trying to come to terms with the ghosts of her past and the tortured realities of a deeply divided America

Elinor Hanson, a forty-something former model, is struggling to reinvent herself as a freelance writer when she receives an unexpected assignment. Her mentor from grad school offers her a chance to write for a prestigious magazine about the Bakken oil boom in North Dakota. Elinor grew up near the Bakken, raised by an overbearing father and a distant Korean mother who met and married when he was stationed overseas. After decades away from home, Elinor returns to a landscape she hardly recognizes, overrun by tens of thousands of newcomers. Surrounded by roughnecks seeking their fortunes in oil and long-time residents worried about their changing community, Elinor experiences a profound sense of alienation and grief. She rages at the unrelenting male gaze, the locals who still see her as a foreigner, and the memories of her family’s estrangement after her mother decided to escape her unhappy marriage, leaving Elinor and her sister behind. The longer she pursues this potentially career-altering assignment, the more her past intertwines with the story she’s trying to tell, revealing disturbing new realities that will forever change her and the way she looks at the world.

With spare and graceful prose, O Beautiful presents an immersive portrait of a community rife with tensions and competing interests, and one woman’s attempts to reconcile her anger with her love of a beautiful, but troubled land.', '2021-06-30', 4);
INSERT INTO books (authorId, title, summary, dateFinished, rating) VALUES ((SELECT id from authors where name='Anna Abney'), 'The Master of Measham Hall', '1665. It is five years since King Charles II returned from exile, the scars of the English Civil Wars are yet to heal and now the Great Plague engulfs the land. Alethea Hawthorne is safe inside the walls of the Calverton household as a companion to their daughter. She waits in anticipation of her brother William’s pardon for killing a man in a duel before they can both return to their ancestral home in Measham Hall.

But when Alethea suddenly finds herself cast out on the streets of London, a long road to Derbyshire lies ahead of her. Militias have closed their boroughs off to outsiders for fear of contamination. Fortune smiles on her when Jack appears, an unlikely travelling companion who helps this determined country girl to navigate a perilous new world of religious dissenters, charlatans and a pestilence that afflicts peasants and lords alike.

Anna Abney''s immersive debut is a fast-paced, multi-layered novel that intimately explores the social and religious divides at the heart of the Restoration period.', '2021-07-14', 3);
INSERT INTO books (authorId, title, summary, dateFinished, rating) VALUES ((SELECT id from authors where name='Sarah Waters'), 'Fingersmith', 'Sue Trinder is an orphan, left as an infant in the care of Mrs. Sucksby, a "baby farmer," who raised her with unusual tenderness, as if Sue were her own. Mrs. Sucksby’s household, with its fussy babies calmed with doses of gin, also hosts a transient family of petty thieves—fingersmiths—for whom this house in the heart of a mean London slum is home.

One day, the most beloved thief of all arrives—Gentleman, an elegant con man, who carries with him an enticing proposition for Sue: If she wins a position as the maid to Maud Lilly, a naïve gentlewoman, and aids Gentleman in her seduction, then they will all share in Maud’s vast inheritance. Once the inheritance is secured, Maud will be disposed of—passed off as mad, and made to live out the rest of her days in a lunatic asylum.

With dreams of paying back the kindness of her adopted family, Sue agrees to the plan. Once in, however, Sue begins to pity her helpless mark and care for Maud Lilly in unexpected ways...But no one and nothing is as it seems in this Dickensian novel of thrills and reversals.', '2021-05-12', 4);

INSERT INTO books_genres (bookId, genreId) VALUES (1,1), (1,3);
INSERT INTO books_genres (bookId, genreId) VALUES (2,1), (2,2);
INSERT INTO books_genres (bookId, genreId) VALUES (3,1), (3,4);
INSERT INTO books_genres (bookId, genreId) VALUES (4,5);
INSERT INTO books_genres (bookId, genreId) VALUES (5,1),(5,2);
INSERT INTO books_genres (bookId, genreId) VALUES (6,5);
INSERT INTO books_genres (bookId, genreId) VALUES (7,6);
INSERT INTO books_genres (bookId, genreId) VALUES (8,5);
INSERT INTO books_genres (bookId, genreId) VALUES (9,5);
