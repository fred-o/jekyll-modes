(require 'poly-markdown)

(defcustom jekyll/yaml-frontmatter
  (pm-hbtchunkmode "yaml"
                   :mode 'yaml-mode
                   :head-reg "\\`---"
                   :tail-reg "[^\\`]---")
  "Yaml chunk"
  :group 'innermodes
  :type 'object)

(defcustom jekyll/markdown 
  (pm-polymode-multi "markdown"
                   :hostmode 'pm-host/markdown
                   :innermodes '(jekyll/yaml-frontmatter))
  "Markdown with YAML frontmatter."
  :group 'polymodes
  :type 'object)

(defcustom jekyll/html
  (pm-polymode-multi "html"
                     :hostmode 'pm-host/html
                     :innermodes '(jekyll/yaml-frontmatter))
  "HTML with YAML frontmatter."
  :group 'polymodes
  :type 'object)

(define-polymode jekyll-markdown-mode jekyll/markdown)
(define-polymode jekyll-html-mode jekyll/html)

(provide 'jekyll-modes)
