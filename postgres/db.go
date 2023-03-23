package postgres

import (
	"gdsc.back/graph/model"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
	"log"
)

type Postgres struct {
	DB *gorm.DB
}

func Connect() *Postgres {
	dbURL := "postgres://pg:pass@localhost:5432/gdsc"

	db, err := gorm.Open(postgres.Open(dbURL), &gorm.Config{})
	if err != nil {
		log.Fatal(err)
		return nil
	}

	err1 := db.AutoMigrate(&model.Comment{}, &model.NewPost{}, &model.Medicine{},
		&model.NewComment{}, &model.NewMedicine{}, &model.Post{})
	if err1 != nil {
		return nil
	}

	return &Postgres{
		DB: db,
	}
}

//func (postgres *Postgres) CreatePost(input *model.NewPost) *model.Post {
//
//}
