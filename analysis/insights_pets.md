# Insights: Pet Data Analysis

## Insights

### 1. Birth date is filled in for only a small share of pets
Across the general dataset, `birth_date`, `age_years`, and `age_months` are 
null for nearly all records — real birth dates exist only for a handful. 
This makes it currently impossible to reliably calculate age or birthdays 
for most pets in the system — the field is either not required at 
registration or owners largely skip it.

### 2. Most owners have only one pet
The `owner_type` segment is dominated by "1 pet," with a few owners having 
3–4. This limits the addressable audience for any multi-pet promotions to 
a narrow segment.

### 3. "Common pets" dominate the portfolio
Cats and dogs make up the majority of records; exotic pets (rodents, fish, 
birds) are a minority. This should inform assortment and content planning — 
mass campaigns should target cat/dog owners, while exotic pet owners need 
separate, narrower content.

### 4. Oldest and youngest pet identified, but sample is limited
Oldest: **Busya**, cat, female, born 2024-09-05 (2 years). Youngest: 
**Cash**, bird, male, born 2025-10-09 (1 year 9 months). Since the query 
only accounts for records with a filled `birth_date` — a minority of the 
dataset — the true oldest/youngest pet in the database may differ from 
these results.

## Findings & Recommendations

**№1 Make birth date mandatory or incentivize filling it in.**  
The "birthday shoutout" concept doesn't scale yet due to missing data. 
Recommendation: require `birth_date` at registration for new pets; for 
existing ones, run a push/email campaign ("add your pet's birthday and get 
a birthday shoutout").

**№2 Launch an automated birthday campaign.**  
Once birth date coverage improves, set up automated email/push messages on 
a pet's birthday with a personalized offer or discount — a simple, 
low-cost retention lever.

**№3 Introduce "Oldest/Youngest Pet of the Month."**  
Once enough birth dates accumulate, regularly (e.g., monthly) highlight the 
platform's oldest and youngest pets publicly — a gamification element that 
encourages full profile completion and repeat visits.

**№4 Segment communication by pet type.**  
Since the base is dominated by cats and dogs, split marketing messaging: 
mass campaigns for "common pets," and a separate, narrower content stream 
(care tips, advice) for exotic pet owners.
