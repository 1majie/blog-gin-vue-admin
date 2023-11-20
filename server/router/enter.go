package router

import (
	"github.com/flipped-aurora/gin-vue-admin/server/router/blog"
	"github.com/flipped-aurora/gin-vue-admin/server/router/example"
	"github.com/flipped-aurora/gin-vue-admin/server/router/system"
)

type RouterGroup struct {
	System  system.RouterGroup
	Example example.RouterGroup
	Blog    blog.RouterGroup
}

var RouterGroupApp = new(RouterGroup)
