package blog

import "time"

type Results struct {
	Subset    string    `json:"subset" form:"subset" gorm:"column:subset;comment:文章子集;size:255;"`           // 文章子集
	CreatedAt time.Time `json:"createdAt" form:"createdAt" gorm:"column:created_at;comment:最早时间;size:255;"` // 最早的文章创建时间
}
