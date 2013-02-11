---
title: Virtualized Development in the Time of Cholera
author: Jon-Wong
date: 2012-5-30 15:38
template: article.jade
---

_Reposted from the blog of [We Have, We Need](http://whwn.tumblr.com/post/24088816666/virtualized-development)_

Here at **[We Have, We Need](http://www.wehave-weneed.org)**, we have a very unique development situation. As students here at the University of California, San Diego, we are expected to do great things in ten week spans; not coincidentally that is the length of our team's developer turn over. It's hard to find good advice on how to address this shortcoming as it is not a commonplace occurrence in industry and we are neither employees nor volunteers, but somewhere in between.

The biggest hurdle over the last three quarters has most definitely been local server deployments. With people joining our team from all different skill levels and backgrounds, as well as wildly varying personal machines and operating systems, asking team members to provision and setup their own machines is a risky, error-prone, and time-consuming task. Additionally, since we deploy and run our code on **[dotCloud](http://www.dotcloud.com)**, the code running on our local machines isn't guaranteed to work the same as it will on the production servers.

To address this issue, we looked into **[Vagrant](http://www.vagrantup.com)** (and [VirtualBox](http://www.virtualbox.org)). After examining our production server packages and libraries, we set up and packaged an Ubuntu 10.04 box that almost exactly matched our production setup (minus nginx and some other more obscure server management libraries). We have both 32- and 64-bit provisioned boxes; we found that while our production servers ran 64-bit systems, a few of our team's machines either were 32-bit or had no support for virtualizing 64-bit guest systems. The rest of our stack, essentially just MongoDB and Django + Python 2.7, are installed and set to run on start. 

Since we have both Linux and Windows specific Vagrant configuration files, each team member copies the one they need and runs `vagrant up`. Our Vagrant configuration is set to share our local files from our code repository. We share local folders for a couple of reasons:

1. Not all of our developers are very comfortable working at the command line. GUI tools and editors are still quite useful to everyone, so being able to work locally instead of over ssh is very helpful. 
2. We have found that the speed decrease is really not that noticeable compared to developing locally, and although we haven't measured it the guys at Vagrant have put down some numbers: [File sharing benchmark at Vagrant](http://vagrantup.com/docs/nfs.html)

In combination with **[Fabric](http://www.fabfile.org)**, a quick and easy deployment tool, new developers don't need to know the intricacies of managing all of our services on whatever platform they are on. A simple run of `fab bootstrap serve` will suitably provision and prepare their virtual machine to serve connections over their localhost. They can access the site via their browser and changes are near instanteous (if there are no bugs!) 

Vagrant, along with VirtualBox and Fabric, have really streamlined our development set up. Regardless of operating system or machine specifications, new team members are up and running in a quarter of the time. When you only have ten weeks to achieve your goal of helping the fight against cholera, that time is essential.

Jon ([@jnwng](http://twitter.com/jnwng))

_we're building a service that connects NGOs and humanitarians in disaster zones via SMS, email, and the web. have some ideas or feedback? send us an email at feedback@wehave-weneed.org_
