# 🐾 Data Analytics for a Pet Services Platform "Pawly"

Team MVP project: an aggregator platform for pet businesses in Kyiv 
(vet clinics, pet shops, grooming salons). 

My role — data analyst: 
database design, SQL analysis, dashboarding, and behavioral analytics.

⚠️ Data note: insights are based on a small sample and short time window, collected manually from open sources. Not representative of the full market.

## What I Did
- Designed a BigQuery schema for the pet services database
- Collected and structured data on real Kyiv pet businesses
- Wrote SQL queries in BigQuery to answer business questions
- Built a Tableau dashboard for visualization
- Analyzed user behavior with PostHog (funnels, retention, traffic sources)
- Prepared an A/B test plan
- Presented findings in a live demo

## Links
- Tableau Dashboard: https://public.tableau.com/views/Book2_17832943278890/BusinessesAnalysis?:language=en-GB&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link
- PostHog Analytics: https://eu.posthog.com/shared/5uBn7-pX5DqRN29iwugzg2whb5krgA
- Database schema: [`/schema/pawly_db_schema.pdf`](schema/pawly_db_schema.pdf)
- SQL Queries: [`/sql`](sql) — [business overview](sql/01_business_overview.sql) and [pet data analysis](sql/02_pet_data_analysis.sql)
- Insights & Analysis: [`/analysis`](analysis) — full write-ups on [businesses](analysis/insights_bigquery.md), [user behavior](analysis/insights_posthog.md), and [pet data](analysis/insights_pets.md)
- A/B Test Plan: [`/analysis/ab_test_plan.md`](analysis/ab_test_plan.md)

## Key Insights

### Business landscape (BigQuery + Tableau)
- Platform covers **123 businesses**: 67 vet clinics, 33 pet shops, 23 grooming salons
- **68.7%** of vet clinics offer emergency care (40.3% 24/7)
- Grooming for exotic pets is nearly non-existent — **1 of 23** salons serve exotic animals → identified as an **untapped niche**
- Businesses are concentrated in **central Kyiv**; residential districts are underrepresented

### User behavior (PostHog)
- **Week 1 retention: 14.5% → Week 2: 0%** — no product hook for return visits
- Organic search drove **1 of 86** sessions — SEO is a critical growth blocker
- **67%** of visitors left without any interaction; median time-to-first-click: 10 seconds
- Mobile brings more visitors, but desktop users view 1.8x more pages per session

### Pet data quality
- Birth date is missing for the majority of pet records — limits personalization features (e.g. birthday campaigns)
- Single-pet owners dominate — affects targeting for multi-pet promotions

## Top Recommendations
1. Fix SEO fundamentals (meta tags, Search Console, unique domain) before scaling paid acquisition
2. Verify Google Ads UTM/attribution setup — paid traffic isn't showing in analytics at all
3. Build retention features (favorites list, review prompts) to address 0% W2 retention
4. Target grooming-for-exotic-pets as a differentiation opportunity
5. Make `birth_date` a required field to unlock personalization campaigns

## Tools
BigQuery · SQL · Tableau · PostHog · A/B Testing

## Repo Structure
- `/sql` — BigQuery queries
- `/schema` — database schema
- `/analysis` — full insight reports (BigQuery, PostHog, pet data, A/B plan)
- `/docs` — demo presentation
