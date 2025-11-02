-- Migration: Insert sample blog posts
-- Generated at: 2025-06-07
-- This migration adds sample posts to populate the blog
-- Insert sample posts (using the authors and categories we created earlier)
-- We'll use DO block to get IDs dynamically
DO $$
DECLARE
  mario_id uuid;
  joshua_id uuid;
  erika_id uuid;
  tech_id uuid;
  lifestyle_id uuid;
  travel_id uuid;
  design_id uuid;
  growth_id uuid;
BEGIN
  -- Get author IDs
  SELECT id INTO mario_id FROM public.authors WHERE email = 'mario@example.com';
  SELECT id INTO joshua_id FROM public.authors WHERE email = 'joshua@example.com';
  SELECT id INTO erika_id FROM public.authors WHERE email = 'erika@example.com';
  -- Get category IDs
  SELECT id INTO tech_id FROM public.categories WHERE slug = 'technology';
  SELECT id INTO lifestyle_id FROM public.categories WHERE slug = 'lifestyle';
  SELECT id INTO travel_id FROM public.categories WHERE slug = 'travel';
  SELECT id INTO design_id FROM public.categories WHERE slug = 'design';
  SELECT id INTO growth_id FROM public.categories WHERE slug = 'personal-growth';
  -- Insert posts
  INSERT INTO public.posts (title, slug, excerpt, content, image_url, author_id, category_id, published, featured, published_at) VALUES
  (
    'Architectural Engineering Wonders of the modern era for your Inspiration',
    'architectural-engineering-wonders',
    'Explore the most impressive architectural achievements that define our modern era.',
    'Modern architecture has pushed the boundaries of what''s possible in construction and design. From towering skyscrapers to innovative sustainable buildings, these structures represent human ingenuity at its finest.',
    'https://stablo-template.vercel.app/_next/image?url=https%3A%2F%2Fcdn.sanity.io%2Fimages%2Fcijrdavx%2Fproduction%2F05951a0ec1a6ffc54f615ab160649e92fea982d0-800x764.png%3Frect%3D0%2C0%2C800%2C468%26w%3D800%26auto%3Dformat&w=3840&q=75',
    mario_id,
    tech_id,
    true,
    true,
    '2022-10-21T10:00:00Z'
  ),
  (
    '5 Effective Brain Recharging Activities No One is Talking About',
    '5-effective-brain-recharging-activities',
    'Discover unique ways to refresh your mind and boost productivity.',
    'In our fast-paced world, taking time to recharge our brains is essential. These five activities go beyond the typical advice and offer fresh perspectives on mental wellness.',
    'https://stablo-template.vercel.app/_next/image?url=https%3A%2F%2Fcdn.sanity.io%2Fimages%2Fcijrdavx%2Fproduction%2F2fda477a7e32f813abb9a8ef425939e6a91c7973-987x1481.png%3Frect%3D0%2C279%2C987%2C607%26w%3D987%26auto%3Dformat&w=3840&q=75',
    joshua_id,
    lifestyle_id,
    true,
    true,
    '2022-10-21T09:00:00Z'
  ),
  (
    '14 Architectural Design Ideas for a Spacious Interior',
    '14-architectural-design-ideas',
    'Transform your living space with these innovative interior design concepts.',
    'Creating a sense of spaciousness doesn''t always require more square footage. These design ideas help you maximize your interior space while maintaining style and functionality.',
    'https://stablo-template.vercel.app/_next/image?url=https%3A%2F%2Fcdn.sanity.io%2Fimages%2Fcijrdavx%2Fproduction%2F12301f301772ed723724302aef7c70c5c1c0151f-4500x8000.jpg%3Frect%3D0%2C1080%2C4500%2C5330%26w%3D2000%26auto%3Dformat&w=3840&q=75',
    mario_id,
    design_id,
    true,
    false,
    '2022-10-21T08:00:00Z'
  ),
  (
    'Every Next Level of Your Life Will Demand a Different You',
    'every-next-level-demands-different-you',
    'Personal growth requires constant evolution and adaptation.',
    'As we progress through life, each new chapter demands that we evolve. This article explores how to embrace change and become the person you need to be for your next level.',
    'https://stablo-template.vercel.app/_next/image?url=https%3A%2F%2Fcdn.sanity.io%2Fimages%2Fcijrdavx%2Fproduction%2F2786bf808843b56a0e0feda1c1747cf73673d989-3648x5472.jpg%3Fw%3D2000%26auto%3Dformat&w=3840&q=75',
    mario_id,
    lifestyle_id,
    true,
    false,
    '2022-10-20T10:00:00Z'
  ),
  (
    'This Bread Pudding Will Give You All the Fall Feels',
    'bread-pudding-fall-feels',
    'A delicious autumn-inspired dessert recipe that brings warmth and comfort.',
    'There''s something magical about fall flavors. This bread pudding recipe combines traditional autumn spices with a modern twist, creating the perfect comfort dessert.',
    'https://stablo-template.vercel.app/_next/image?url=https%3A%2F%2Fcdn.sanity.io%2Fimages%2Fcijrdavx%2Fproduction%2Fb7d2fa6d0b250bd1e0c601645319db4cde42a01e-3958x5937.jpg%3Fw%3D2000%26auto%3Dformat&w=3840&q=75',
    erika_id,
    travel_id,
    true,
    false,
    '2022-10-19T10:00:00Z'
  ),
  (
    'I Moved Across the Country and Never Looked Back',
    'moved-across-country',
    'A personal story about taking risks and finding new beginnings.',
    'Sometimes the biggest leaps of faith lead to the greatest rewards. This is my story of leaving everything behind and starting fresh in a new place.',
    'https://stablo-template.vercel.app/_next/image?url=https%3A%2F%2Fcdn.sanity.io%2Fimages%2Fcijrdavx%2Fproduction%2Fa5bd8977e7fd82666c00a45948583b1f9912d392-3847x5583.jpg%3Fw%3D2000%26auto%3Dformat&w=3840&q=75',
    joshua_id,
    travel_id,
    true,
    false,
    '2022-10-18T10:00:00Z'
  ),
  (
    '3 Meaningful Ways to Practice Self-Care as an Introvert',
    '3-ways-self-care-introvert',
    'Self-care strategies designed specifically for introverted personalities.',
    'Introverts have unique needs when it comes to self-care. These three approaches honor your need for solitude while promoting mental and emotional wellbeing.',
    'https://stablo-template.vercel.app/_next/image?url=https%3A%2F%2Fcdn.sanity.io%2Fimages%2Fcijrdavx%2Fproduction%2Fc366d5116a51d3f1d8b23962e6b7caac7c960f81-7855x5240.jpg%3Fw%3D2000%26auto%3Dformat&w=3840&q=75',
    mario_id,
    growth_id,
    true,
    false,
    '2022-10-18T09:00:00Z'
  ),
  (
    'The Rise of Artificial Intelligence and the Future of Humans',
    'ai-future-of-humans',
    'Exploring the implications of AI advancement on human society.',
    'As artificial intelligence continues to evolve, we must consider its impact on humanity. This article examines both the opportunities and challenges that lie ahead.',
    'https://stablo-template.vercel.app/_next/image?url=https%3A%2F%2Fcdn.sanity.io%2Fimages%2Fcijrdavx%2Fproduction%2Fe60f8ab265df3c22fdde5469de54d225017b7323-4000x5000.jpg%3Fw%3D2000%26auto%3Dformat&w=3840&q=75',
    joshua_id,
    growth_id,
    true,
    false,
    '2022-10-18T08:00:00Z'
  ),
  (
    '10 Simple Practices That Will Help You Get 1% Better Every Day',
    '10-practices-1-percent-better',
    'Small daily improvements that compound into significant personal growth.',
    'The concept of getting 1% better each day might seem small, but the compound effect is remarkable. These ten practices will help you build momentum in your personal development journey.',
    'https://stablo-template.vercel.app/_next/image?url=https%3A%2F%2Fcdn.sanity.io%2Fimages%2Fcijrdavx%2Fproduction%2F86cb3a2f0e43610371a7184483c5567bd9e6e94f-2400x1600.jpg%3Fw%3D2000%26auto%3Dformat&w=3840&q=75',
    erika_id,
    growth_id,
    true,
    false,
    '2022-10-04T10:00:00Z'
  ),
  (
    'Every Artist has to see the Amazing Pictures on the Internet',
    'artist-amazing-pictures-internet',
    'A curated collection of inspiring visual art from around the web.',
    'The internet has become an incredible gallery of artistic expression. These stunning images showcase the diversity and creativity of modern digital art.',
    'https://stablo-template.vercel.app/_next/image?url=https%3A%2F%2Fcdn.sanity.io%2Fimages%2Fcijrdavx%2Fproduction%2F279c03681911845947cd044b4ac9e91d7a3a628c-987x1481.png%3Fw%3D987%26auto%3Dformat&w=3840&q=75',
    mario_id,
    design_id,
    true,
    false,
    '2022-10-02T10:00:00Z'
  ),
  (
    'How Technology Evolved Under the Bright Sun of Universe',
    'technology-evolved-universe',
    'Tracing the cosmic journey of technological advancement.',
    'From the first sparks of innovation to the cutting-edge technology of today, this article explores how human ingenuity has evolved alongside our understanding of the universe.',
    'https://stablo-template.vercel.app/_next/image?url=https%3A%2F%2Fcdn.sanity.io%2Fimages%2Fcijrdavx%2Fproduction%2F123fb8836aaf097b83d4c5e8fde544dd1747af0d-5064x3376.jpg%3Fw%3D2000%26auto%3Dformat&w=3840&q=75',
    erika_id,
    tech_id,
    true,
    false,
    '2022-09-30T10:00:00Z'
  ),
  (
    'Lessons Of Happiness I learned from a Mountain Village',
    'lessons-happiness-mountain-village',
    'Finding joy and wisdom in simple, remote communities.',
    'A transformative visit to a mountain village taught me invaluable lessons about happiness, community, and what truly matters in life.',
    'https://stablo-template.vercel.app/_next/image?url=https%3A%2F%2Fcdn.sanity.io%2Fimages%2Fcijrdavx%2Fproduction%2F5be1635417f1814b3fb09f8e9f74f37079899f72-4032x3024.jpg%3Fw%3D2000%26auto%3Dformat&w=3840&q=75',
    joshua_id,
    travel_id,
    true,
    false,
    '2022-09-25T10:00:00Z'
  ),
  (
    'There''s Nothing New About Undermining Women''s Autonomy',
    'undermining-womens-autonomy',
    'A critical look at ongoing challenges to women''s rights and independence.',
    'Throughout history, women''s autonomy has been challenged in various ways. This article examines the persistent patterns and why we must remain vigilant in protecting these fundamental rights.',
    'https://stablo-template.vercel.app/_next/image?url=https%3A%2F%2Fcdn.sanity.io%2Fimages%2Fcijrdavx%2Fproduction%2Fe60f8ab265df3c22fdde5469de54d225017b7323-4000x5000.jpg%3Fw%3D2000%26auto%3Dformat&w=3840&q=75',
    erika_id,
    lifestyle_id,
    true,
    false,
    '2022-09-23T10:00:00Z'
  ),
  (
    'Escape Fantasies of the Tech Billionaires',
    'escape-fantasies-tech-billionaires',
    'Examining the disconnect between tech elite and everyday reality.',
    'As tech billionaires dream of Mars colonies and seasteading, we explore what these escape fantasies reveal about wealth, responsibility, and the future of humanity.',
    'https://stablo-template.vercel.app/_next/image?url=https%3A%2F%2Fcdn.sanity.io%2Fimages%2Fcijrdavx%2Fproduction%2F123fb8836aaf097b83d4c5e8fde544dd1747af0d-5064x3376.jpg%3Fw%3D2000%26auto%3Dformat&w=3840&q=75',
    erika_id,
    tech_id,
    true,
    false,
    '2022-09-21T10:00:00Z'
  );
END $$;