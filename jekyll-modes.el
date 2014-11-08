(require 'poly-markdown)
(require 'liquid-tags-mode)

(defcustom jekyll/yaml-frontmatter
  (pm-hbtchunkmode "yaml"
                   :mode 'yaml-mode
                   :head-reg "\\`---"
                   :tail-reg "[^\\`]---")
  "Yaml chunk"
  :group 'innermodes
  :type 'object)

(defcustom jekyll/liquid-tag
  (pm-hbtchunkmode "liquid"
                   :mode 'liquid-tags-mode
                   :head-reg "{%"
                   :tail-reg "%}")
  "Liquid tag"
  :group 'innermodes
  :type 'object)

(defcustom jekyll/liquid-expression
  (pm-hbtchunkmode "liquid"
                   :mode 'liquid-tags-mode
                   :head-reg "{{"
                   :tail-reg "}}")
  "Liquid expression"
  :group 'innermodes
  :type 'object)

(defcustom jekyll/markdown 
  (pm-polymode-multi "markdown"
                     :hostmode 'pm-host/markdown
                     :innermodes '(jekyll/yaml-frontmatter
                                   jekyll/liquid-tag jekyll/liquid-expression))
  "Markdown with YAML frontmatter and Liquid tags support."
  :group 'polymodes
  :type 'object)

(defcustom jekyll/html
  (pm-polymode-multi "html"
                     :hostmode 'pm-host/html
                     :innermodes '(jekyll/yaml-frontmatter
                                   jekyll/liquid-tag jekyll/liquid-expression))

  "HTML with YAML frontmatter and Liquid tags support."
  :group 'polymodes
  :type 'object)

(define-polymode jekyll-markdown-mode jekyll/markdown)
(define-polymode jekyll-html-mode jekyll/html)

(provide 'jekyll-modes)
