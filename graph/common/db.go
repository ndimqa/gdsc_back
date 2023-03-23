package common

import (
	"gdsc.back/graph/model"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
	"gorm.io/gorm/logger"
	"log"
)

func InitDb() (*gorm.DB, error) {
	dbURL := "postgres://pg:pass@localhost:5432/gdsc"

	db, err := gorm.Open(postgres.Open(dbURL), &gorm.Config{
		Logger: logger.Default.LogMode(logger.Silent),
	})
	if err != nil {
		log.Fatal(err)
		return nil, err
	}

	err = db.AutoMigrate(&model.Medicine{}, &model.Comment{}, &model.Post{})
	if err != nil {
		return nil, err
	}
	return db, nil
}
