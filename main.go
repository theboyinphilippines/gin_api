package main

import (
	"gin_api/controller"
	"gin_api/middleware"
	"github.com/gin-gonic/gin"
)

func main() {
	r := gin.Default()
	//统一响应
	r.POST("/user/login", controller.UserLogin)
	userv1 := r.Group("/user/v1").Use(middleware.JWTAuth())

	{
		userv1.POST("/userInfo", controller.UserInfo)
	}
	r.Run() // listen and serve on 0.0.0.0:8080 (for windows "localhost:8080")
}
