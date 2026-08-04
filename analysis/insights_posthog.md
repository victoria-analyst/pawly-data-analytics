# Insights: User Behavior Analysis (PostHog)

🔗 [View live PostHog dashboard](https://eu.posthog.com/shared/5uBn7-pX5DqRN29iwugzg2whb5krgA)

> ⚠️ **Data limitations:** insights are based on a small sample and a short 
> time window — conclusions about seasonality or long-term trends are not 
> possible.

## Insights

### Traffic sources: organic search and paid ads barely convert visitors
Of 86 recorded sessions, 83 were direct traffic, while organic search 
brought only 1 visitor and referrals brought 2. Notably, despite a running 
Google Ads campaign, no paid traffic channel appears in the data at all — 
either the campaign generated no real clicks, or tracking is misconfigured 
(missing UTM tags or gclid parameters for attribution). Either way, the ad 
spend is currently unmeasurable.

### Retention is critically low: almost no one returns in week 2
**Week 1 retention averages 14.5%** (average cohort size: 28 users), 
**dropping to 0.0% in Week 2**. The product currently gives minimal reason 
to return, and the few users who do come back a second time (likely 
including the dev team) drop off entirely by week three. For any 
monetization model dependent on visit frequency (ads, subscriptions, paid 
features), zero retention means there's currently no foundation to build on.

### High bounce rate and near-instant page exits
Homepage bounce rate is **45.8%**. In the "view → interact" funnel, of 85 
visitors only 28 (32.9%) took any action — the remaining 57 (67.1%) left 
without interacting at all. Median time to first click is just **10 
seconds**. Most users decide whether to stay almost instantly, and the page 
isn't capturing interest fast enough.

### Mobile leads in volume, but desktop users go deeper per session
Mobile: 50 unique visitors, 90 pageviews (~1.8 pages/visitor). Desktop: 40 
visitors, 128 pageviews (~3.2 pages/visitor). While most traffic now comes 
from mobile, desktop users explore the catalog more thoroughly — the mobile 
experience likely needs UX attention to close this gap.

## Key Findings & Recommendations

**#1 SEO is the biggest growth blocker, needs immediate attention.**  
Only 1 of 86 visitors arrived via organic search. Before investing further 
in ad-driven monetization, this needs fixing: rebrand or add a unique 
tagline to meta tags, set up title/description/schema markup per business 
page (also improves rich snippet chances), register the site in Google 
Search Console, and consider a more distinctive domain/brand name if the 
current one is already taken by competitors.

**#2 Verify Google Ads campaign attribution.**  
Since paid traffic isn't showing as a distinct channel, check UTM tagging 
on ad links and PostHog configuration before the next campaign — without 
this, ad spend ROI can't be evaluated.

**#3 Build retention features to drive return visits.**  
Add a "Favourites" page where users can save businesses and receive 
email/push reminders ("you saved this place — check their current offers"). 
Gives users a natural reason to come back.

**#4 Add review/rating prompts after a visit.**  
Gives new users a quality benchmark, builds trust in business profiles, and 
creates an additional incentive to return after interacting with a business.

**#5 — Optimize the mobile experience.**  
The gap in page depth between desktop (3.2 pages) and mobile (1.8 pages) 
suggests mobile navigation friction. Recommend a dedicated UX review of the 
mobile catalog and profile pages.
