+++
title = "Don’t be Programming Languages researchers"
summary = "A pointless diatribe about PL research"
date = 2018-09-22T21:52:05-04:00
draft = false

# Tags and categories
# For example, use `tags = []` for no tags, or the form `tags = ["A Tag", "Another Tag"]` for one or more tags.
tags = ["rambling", "research"]
categories = []

# Featured image
# Place your image in the `static/img/` folder and reference its filename below, e.g. `image = "example.jpg"`.
[header]
image = ""
caption = ""

+++

> Instead of being a judgement of what PL research should be, this short post is
simply a reflection of my research interests and what role PL plays into it.

During a recent PLDG talk, the speaker said, "I think that, as a community, PL
people have a moral responsibility to step in and say, ‘No, you're having fun
wrong!’" While I have no qualms about the comment itself (jokes can be useful
tool in presentations), it led me to think about the
way PL research is applied in new domains.

In a classic programming languages presentation, the speaker starts with an
overview of a domain, talks about the current state of the art of
programming languages and tools in it, and then go on to point out that most
tools and languages fail to make use of amazing and well-known PL
techniques. Then they describe their work which applies the aforementioned PL
technique and build cool and interesting language abstractions with the promise
of building better and improved tools for the domain[^1].

While I strongly endorse PL techniques and research being applied in new
domains, this story demonstrates a fundamental issue for me: Application of PL techniques is
done retrospectively. PL researchers are not there when a domain is shaping up
and people trying to build tools and programming languages for that domain.
Only once people have made build these tools, which in turn cement
themselves into domain, do PL researchers come into the scene and apply their
cool techniques---at a point where practitioners are unlikely to adopt something
new.

So here is my solution: We should stop being PL researchers---we should take it
upon themselves to learn about new domains and apply ourselves well before
the standards are established.
Programming
languages are the fundamental way of communicating intent to computers. As
PL researchers, we should be actively helping people from other domains, not
waiting for them to realize the error of their ways and come to us.

[^1]: It is rarely the case that the tool or language proposed actually solves the problems in the motivation. *Yes, do tell me how your tiny language will stop Google from going down twice a year.*