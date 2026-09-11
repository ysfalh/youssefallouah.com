---
layout: post
title: "What Peer Review Rewards"
date: 2026-04-17
last_modified_at: 2026-09-10
author: "Youssef Allouah"
permalink: /2026/04/17/what-peer-review-rewards.html
sidenotes: true
excerpt: "Random audits of accepted papers could encourage more careful research by tying the credit a paper receives to how well its claims hold up."
description: "Random audits of accepted papers could encourage more careful research by tying the credit a paper receives to how well its claims hold up."
references:
  - id: neurips
    number: 1
    authors: "NeurIPS"
    bibliography_authors: "NeurIPS"
    title: "NeurIPS 2025 – Fact Sheet"
    details: "2025."
    url: "https://media.neurips.cc/Conferences/NeurIPS2025/press/NeurIPS2025-Fact_Sheet.pdf"
  - id: incentives
    number: 2
    authors: "Brian A. Nosek, Jeffrey R. Spies, and Matt Motyl"
    bibliography_authors: "Nosek, Brian A., Jeffrey R. Spies, and Matt Motyl"
    title: "Scientific Utopia: II. Restructuring Incentives and Practices to Promote Truth Over Publishability"
    publication: "Perspectives on Psychological Science"
    details: "7, no. 6 (2012): 615–631."
    url: "https://journals.sagepub.com/doi/10.1177/1745691612459058"
  - id: recommenders
    number: 3
    authors: "Maurizio Ferrari Dacrema, Paolo Cremonesi, and Dietmar Jannach"
    bibliography_authors: "Ferrari Dacrema, Maurizio, Paolo Cremonesi, and Dietmar Jannach"
    title: "Are We Really Making Much Progress? A Worrying Analysis of Recent Neural Recommendation Approaches"
    publication: "Proceedings of the 13th ACM Conference on Recommender Systems"
    details: "(2019): 101–109."
    url: "https://arxiv.org/abs/1907.06902"
  - id: ai-analysts
    number: 4
    authors: "Martin Bertran, Riccardo Fogliato, and Zhiwei Steven Wu"
    bibliography_authors: "Bertran, Martin, Riccardo Fogliato, and Zhiwei Steven Wu"
    title: "Many AI Analysts, One Dataset: Navigating the Agentic Data Science Multiverse"
    publication: "Proceedings of the National Academy of Sciences"
    details: "123, no. 29 (2026): e2606495123."
    url: "https://doi.org/10.1073/pnas.2606495123"
  - id: reproducibility
    number: 5
    authors: "Joelle Pineau et al."
    bibliography_authors: "Pineau, Joelle, Philippe Vincent-Lamarre, Koustuv Sinha, Vincent Lariviere, Alina Beygelzimer, Florence d’Alche-Buc, Emily Fox, and Hugo Larochelle"
    title: "Improving Reproducibility in Machine Learning Research (A Report from the NeurIPS 2019 Reproducibility Program)"
    publication: "Journal of Machine Learning Research"
    details: "22, no. 164 (2021): 1–20."
    url: "https://jmlr.org/papers/v22/20-303.html"
  - id: tmlr
    number: 6
    authors: "Transactions on Machine Learning Research"
    bibliography_authors: "Transactions on Machine Learning Research"
    title: "Accepted Papers: Reproducibility Certification"
    url: "https://jmlr.org/tmlr/papers/"
  - id: refutations
    number: 7
    authors: "Rylan Schaeffer et al."
    bibliography_authors: "Schaeffer, Rylan, Joshua Kazdan, Yegor Denisov-Blanch, Brando Miranda, Matthias Gerstgrasser, Susan Zhang, Andreas Haupt, Isha Gupta, Elyas Obbad, Jesse Dodge, Jessica Zosa Forde, Francesco Orabona, Sanmi Koyejo, and David Donoho"
    title: "Position: Machine Learning Conferences Should Establish a ‘Refutations and Critiques’ Track"
    publication: "Advances in Neural Information Processing Systems"
    details: "38 (NeurIPS 2025), Position Paper Track."
    url: "https://proceedings.nips.cc/paper_files/paper/2025/hash/9118ad115831e52cfeec1acd40c6e0f3-Abstract-Position_Paper_Track.html"
  - id: audits
    number: 8
    authors: "Adrian G. Barnett, Pauline Zardo, and Nicholas Graves"
    bibliography_authors: "Barnett, Adrian G., Pauline Zardo, and Nicholas Graves"
    title: "Randomly Auditing Research Labs Could Be an Affordable Way to Improve Research Quality: A Simulation Study"
    publication: "PLOS ONE"
    details: "13, no. 4 (2018): e0195613."
    url: "https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0195613"
---

NeurIPS decisions are coming soon, and I once again think of multiple discussions with friends and peers on whether paper acceptance carries any meaning anymore, given the ridiculous numbers of (accepted) submissions at these traditionally selective venues. For example, NeurIPS 2025 received more than 20,000 submissions, about a quarter of which were accepted.{% include sidenote.html id="neurips" %} This is perhaps more than I can read in a lifetime.

Paper acceptance is a familiar event in a researcher’s career, with known immediate implications. It adds a publication to the CV, can make the work easier to publicize, and can help with hiring and funding. However, what happens after that notification is less predictable and likely more important for the community: other researchers may build on the result or discover its limitations. But that later evidence has no equally clear place in how we evaluate the work.

I think this imbalance deserves more attention in discussions of peer review. In these, we often ask how to make reviewers more careful and decisions more reliable. Those are worthwhile questions! I argue that we should also ask what authors have reasons to optimize for, building on discussions of research incentives in fields such as psychology.{% include sidenote.html id="incentives" %} This can be illuminating for the earlier question of peer review quality as well.

Consider an author deciding how to spend the week before a deadline. Improving the presentation may help reviewers understand the contribution. Checking a stronger baseline might reveal that the improvement is smaller than it first appeared. Documenting the experimental setup better could save another researcher days of work. The concern is that work which makes a paper easier to accept can receive more reliable recognition than work which makes its claims easier to trust.

Better reviewing can help align those rewards. Reviewers can insist on appropriate comparisons, ask authors to narrow unsupported claims, and recognize careful experimental work. I would complement that effort by making evidence gathered after acceptance matter more to the credit a paper receives.

## Making later evidence matter

I stumbled upon a study in recommender systems (intentionally in the pre-AI era), where Ferrari Dacrema et al. (2019) revisited published "neural methods" and found that simpler baselines often outperformed the few methods they could reproduce and which were believed to be state-of-the-art.{% include sidenote.html id="recommenders" %}

Generative AI may make it easier to search for analyses that support a preferred conclusion and persuade reviewers. For example, Bertran, Fogliato, and Wu (2026) found that AI analysts reached different conclusions from the same data and hypothesis, and that prompts to seek supporting evidence shifted the results.{% include sidenote.html id="ai-analysts" %} Yet the same tools could help us examine, even before submission, how much a conclusion depends on unexplained analytical choices.

These studies show the value of looking more closely at published claims. My concern is how unevenly that scrutiny is distributed, and how uncertain its consequences are. A prominent paper may receive several independent investigations, while a less visible paper receives none. If authors expect little follow-up, or expect its findings to have little effect on how their work is evaluated, the incentive to invest in additional checking remains weak.

## An audit lottery

One way to encourage this change would be for conferences to support independent checks on a randomly selected sample of accepted papers. The program would be announced before submission, so authors would know that their work might be examined.

Random selection matters because it extends the possibility of scrutiny beyond work that is already famous or controversial. Targeted investigations would still be valuable, particularly for consequential claims. But a lottery would give ordinary papers a chance of being checked, which is necessary if we want the possibility of verification to influence how ordinary papers are prepared. It is a bit like security checks at the airport: you may or may not get an extra check after you pass the mandatory one, and if you had bad intentions, the mere possibility of the extra check may have the same deterrent effect as a certain extra check.

Still in the interest of scalability, each audit would only examine a limited set of claims. Suppose a paper reports that a new training method outperforms existing approaches on several tasks. An independent team might reproduce a central comparison, examine whether the baselines received comparable tuning, and run additional seeds. The report would explain what those checks establish about the claimed improvement. If the available resources were insufficient to resolve the question, it would also say so.

The methods and supporting results should be public where possible, with space for an author response and another independent assessment of consequential disputes. Auditors can make mistakes too. The point would be to give readers evidence they can inspect, rather than another unexplained verdict. Selection would not automatically question acceptance, although findings could warrant corrections or other action through the appropriate procedures.

There are already efforts to build on, fortunately. For example, the NeurIPS 2019 reproducibility program combined a code submission policy, a reproducibility challenge, and a checklist.{% include sidenote.html id="reproducibility" %} TMLR recognizes reproducibility studies as publishable contributions.{% include sidenote.html id="tmlr" %} Along similar lines, Schaeffer et al. (2025) propose a dedicated “Refutations and Critiques” track at ML conferences to give researchers recognition for critically examining published work.{% include sidenote.html id="refutations" %} Barnett et al. (2018) have already explored random audits in the context of health research, using simulations to study how they could encourage more careful work.{% include sidenote.html id="audits" %} We could adapt their proposal to conference-supported checks of accepted papers, with findings attached to the work and considered in its subsequent evaluation.

## Would it change behavior?

An audit lottery would only affect incentives if authors expected both a meaningful chance of being checked and meaningful consequences from the findings. Again, those consequences need not involve withdrawing acceptance. They could include greater confidence in a result, recognition for careful work, or reduced confidence in a claim that does not survive examination. But if audit reports are rarely read or used, the mechanism would be weak. Indeed, conferences can make the evidence accessible; they cannot, by themselves, ensure that the rest of the field takes it seriously. The program would certainly need real resources to work. For example, qualified auditors can receive credit through citable reports and support for their time and compute.

It is reasonable to imagine starting with a small funded pilot and examining both what it discovers and what happens to those findings. Do reports lead to corrections, better comparisons, or useful confirmations? Do subsequent researchers and reviewers use them? Is that value worth the effort, compared with supporting researcher-selected reproduction studies or improving the original reviews?

It seems that an audit lottery is worth trying. It actually seems "trivial" after the fact: if later scrutiny mattered more to the credit a paper receives, authors would have more reason to check and document their work before submission.

## Acknowledgements

Thanks to Gautam Kamath, Sanmi Koyejo, Mahdi Haghifam, John Duchi, Andreas Haupt, Rylan Schaeffer, and Lydia Zakynthinou for stimulating discussions.
