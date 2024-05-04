(uiop:define-package #:staticl-docs/introduction
  (:use #:cl)
  (:import-from #:named-readtables
                #:in-readtable)
  (:import-from #:40ants-doc
                #:defsection)
  (:import-from #:pythonic-string-reader
                #:pythonic-string-syntax))
(in-package #:staticl-docs/introduction)

(in-readtable pythonic-string-syntax)


(defsection @introduction (:title "Introduction")
  """
# Why do we need static website generators?

In the era of high technology and fast access to information, when every second of page loading is worth its weight in gold, static website generators come to the fore. But why are they so important? And which tool should I choose to create the perfect static website?

We present to your attention `StatiCL` — one of the most promising tools in this niche. But before we dive into the specifics of `StatiCL`, let's figure out what static site generators are for and what advantages they bring.

## The main advantages of static site generators

- No movement, no problem. Static sites are much more resistant to hacker attacks, because they simply do not have a server that can be hacked.
- Instant page loading becomes a reality, as static content is easily cached and does not require additional processing by the server.
- Has your website suddenly gained popularity? Static sites can easily withstand traffic growth without the need for complex infrastructure configuration.
- Using version control systems such as Git, you can always roll back to a previous version of the site or make changes without risking the current operating environment.
- Static pages do not require complex server solutions, which significantly reduces the cost of hosting.

## How static site generators work

Generators convert content from a simple Markdown markup language to HTML and CSS. They allow you to create beautiful and readable web pages without requiring the developer to write complex code. Generators greatly simplify the process of website development by providing fast and efficient formatting of text, inserting images, videos and other multimedia components.

You can use various methods to host a static site, including Github Pages, CDN, or other affordable cheap hosting services. Github Pages is a free service provided by Github that allows you to host static sites directly from the repository on Github. This is a convenient way to host small projects or personal pages. CDN (Content Delivery Network) is a network of servers distributed around the world that helps speed up the loading of content on a site due to the proximity of servers to end users. This is especially useful for sites with a large number of visitors and traffic. If you have a budget, you can also consider other cheap hosting providers that offer good conditions for hosting static sites. It is important to consider the requirements of your project and choose the appropriate option that meets your needs in terms of performance, reliability and price.

## Why was `StatiCL` created

At [40Ants](https://40ants.com/), we believe in the power of Common Lisp and use it as the basis of all our projects. We used to work with the [Coleslaw](https://github.com/coleslaw-org/coleslaw) static blog generator, but we encountered some of its limitations. For example, it was difficult for us to create a website in several languages and set up the main page in a different way than just a list of articles. Coleslaw is more suitable for blogs than for sites with a diverse structure. Therefore, we have developed a `StatiCL` tool with even more flexibility. With `StatiCL`, you can create a static website of any complexity, without limiting yourself to blog templates.

In `StatiCL`, you can easily create extensions, as well as use any template engine, not limited to Clozure Templates. This gives you more freedom in choosing tools to work with your static sites and allows you to use those technologies that are more convenient and familiar to you. The flexibility of `StatiCL` makes it an excellent choice for developers who want to create high-quality static websites optimized for their needs and preferences.

## The basic principles underlying `StatiCL`

`StatiCL` is an innovative content processing system based on the pipeline concept. The pipeline consists of various nodes, each of which receives all the content objects generated by the previous parts of the pipeline. Each node has the ability to modify existing content or add new elements to it. This allows you to create unique and high-quality content enriched with a variety of data and information. In addition, thanks to the use of a content processing pipeline, `StatiCL` provides efficient and fast information processing. Each stage of the pipeline is performed sequentially, which allows you to optimize the process of creating content and improve its quality. This approach allows users to easily manage the content processing process and create unique materials for various purposes. Thanks to the flexible pipeline structure and the ability to add new nodes, `StatiCL` provides a high degree of personalization and customization of the content processing process for specific user needs. Thus, the system allows you to create content that meets the individual requirements and tasks of users, ensuring high efficiency and effectiveness of work.  

The pipeline describing the site generation is written in Lisp and is a series of nested function calls. Each site using `StatiCL` must contain a .staticlrc file in its root directory, which contains a description of the pipeline. This is how the simplest description of the site looks like:

```lisp
(site "Trivial Site"
      :description "A trivial staticl site."
      :url "https://example.com"
      :pipeline (list (load-content))
      :theme "readable")
```

When you run the staticl generate command, the engine will start processing content from files on disk. It will read all the files with the post and page extensions, and then create the corresponding html files. This way, you will receive ready-made files that can be easily placed on the site for visitors to view.

To create an RSS feed for all blog posts, you need to add a new step in the `StatiCL` pipeline. Let's create an element `(rss)` that will be responsible for generating the RSS feed. This element will extract data about blog posts and generate an appropriate XML file containing information about the titles, publication date and content of each post. This way users will be able to subscribe to blog updates via RSS readers.

```lisp
(site "Trivial Site"
      :description "A trivial staticl site."
      :url "https://example.com"
      :pipeline (list (load-content)
                      (rss))
      :theme "readable")
```

When creating `sitemap.xml` In addition to RSS, we can add another step to our pipeline - creating a sitemap. This file is a special format that allows search engines to index pages of our site more efficiently. Creation `sitemap.xml` It will help to improve the SEO optimization of the site, as search engines will be able to detect and index new content faster. In addition, `sitemap.xml` allows you to tell search engines which pages are the most important for indexing, which can also affect the ranking of the site in search results.

```lisp
(site "Trivial Site"
      :description "A trivial staticl site."
      :url "https://example.com"
      :pipeline (list (load-content)
                      (rss)
                      (sitemap))
      :theme "readable")
```

The `(sitemap)` step will receive all the content created by the previous steps and create a file at the output `sitemap.xml`.

In addition to sequentially executing the pipeline steps, you can split the content into different "streams". For example, you can filter them by the language in which the texts are written, and perform different pipeline steps for each language. For example, you can create separate RSS feeds for each language. You can read more about this in the tutorial.
"""
  )
