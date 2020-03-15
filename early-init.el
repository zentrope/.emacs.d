;; [[https://protesilaos.com/dotemacs/#h:584c3604-55a1-49d0-9c31-abe46cb1f028]]
(setq frame-inhibit-implied-resize t)
(setq gc-cons-threshold-original gc-cons-threshold)
(setq gc-cons-threshold 100000000)
(add-hook 'after-init-hook (lambda ()
                             (setq gc-cons-threshold gc-cons-threshold-original)))
