<div align="center">

# xournalpp-preview.yazi

A [yazi](https://github.com/sxyazi/yazi) plugin to preview Xournal++ files.

![screenshot-020525-135507](https://github.com/user-attachments/assets/0abeb95a-aedc-446c-8238-938d557a0528)

## 

</div>

## Requirements
- [yazi](https://github.com/sxyazi/yazi)
- [Xournall++](https://xournalpp.github.io/)

## Installation
```sh
git clone https://github.com/danielml-mx/xournalpp-preview.yazi.git ~/.config/yazi/plugins/
```

## Usage

Make sure you add the following to your `yazi.toml` file

```toml
[[plugin.prepend_previewers]]
mime = "application/gzip"
run = "xournalpp-preview"
```

Or if you're already using the other style:
```toml
[plugin]
prepend_previewers = [
    # ...
    { mime = "application/gzip", run = "xournalpp-preview" },
]
```

You probably also want to change your config so that .xopp files are handled differently from regular `application/gzip` files:
```toml
[plugin]
prepend_previewers = [
    # ...
	{ name = "*.xopp", use = "open" },
	{ mime = "application/{zip,rar,7z*,tar,gzip,xz,zstd,bzip*,lzma,compress,archive,cpio,arj,xar,ms-cab*}", use = [ "extract", "reveal" ] },
]
```

## TODO
Perhaps seeking could be added, but I have not tinkered enough with yazi's Lua backend to figure it out. If you do, submit a PR and I'll gladly accept it.

## License
The only good licence is the GPL.
