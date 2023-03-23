package graph

// This file will be automatically regenerated based on the schema, any resolver implementations
// will be copied through when generating and any unknown code will be moved to the end.
// Code generated by github.com/99designs/gqlgen version v0.17.27

import (
	"context"
	"gdsc.back/graph/common"
	"gdsc.back/graph/model"
	"log"
)

// CreatePost is the resolver for the createPost field.
func (r *mutationResolver) CreatePost(ctx context.Context, input model.NewPost) (*model.Post, error) {
	log.Println("Creating Post Request")
	context_ := common.GetContext(ctx)
	post := &model.Post{
		Text:   input.Text,
		Image:  input.Image,
		Header: input.Header,
	}
	err := context_.Database.Create(&post).Error
	log.Println("Post created! ID: ", post.ID)
	if err != nil {
		log.Println("Error occured: ", err)
		return nil, err
	}
	return post, nil
}

// CreateComment is the resolver for the createComment field.
func (r *mutationResolver) CreateComment(ctx context.Context, input model.NewComment) (*model.Comment, error) {
	log.Println("Creating Comment Request")
	context_ := common.GetContext(ctx)
	var medicine *model.Medicine
	context_.Database.First(&medicine, "_id=?", input.MedicineID)
	comment := &model.Comment{
		Text:       input.Text,
		MedicineID: input.MedicineID,
	}
	medicine.Comments = append(medicine.Comments, comment)
	context_.Database.Save(&medicine)
	err := context_.Database.Create(&comment).Error
	if err != nil {
		log.Println("Error occured: ", err)
		return nil, err
	}
	log.Println("Comment created! ID: ", comment.ID, " For Medicine ID: ", medicine.ID)
	return comment, nil
}

// CreateMedicine is the resolver for the createMedicine field.
func (r *mutationResolver) CreateMedicine(ctx context.Context, input model.NewMedicine) (*model.Medicine, error) {
	log.Println("Creating Medicine Request")
	context_ := common.GetContext(ctx)
	medicine := &model.Medicine{
		Name:        input.Name,
		Description: input.Description,
		Comments:    nil,
	}
	err := context_.Database.Create(&medicine).Error
	if err != nil {
		log.Println("Error occured: ", err)
		return nil, err
	}
	log.Println("Medicine created! ID: ", medicine.ID)
	return medicine, nil
}

// Posts is the resolver for the Posts field.
func (r *queryResolver) Posts(ctx context.Context) ([]*model.Post, error) {
	log.Println("Get Posts Request")
	context_ := common.GetContext(ctx)
	var posts []*model.Post
	err := context_.Database.Find(&posts).Error
	if err != nil {
		log.Println("Error occured: ", err)
		return nil, err
	}
	return posts, nil
}

// Medicines is the resolver for the Medicines field.
func (r *queryResolver) Medicines(ctx context.Context) ([]*model.Medicine, error) {
	log.Println("Get Medicines Request")
	context_ := common.GetContext(ctx)
	var posts []*model.Medicine
	err := context_.Database.Find(&posts).Error
	if err != nil {
		log.Println("Error occured: ", err)
		return nil, err
	}
	return posts, nil
}

// Medicine is the resolver for the medicine field.
func (r *queryResolver) Medicine(ctx context.Context, id int) (*model.Medicine, error) {
	log.Println("Get Medicine Request! ID: ", id)
	context_ := common.GetContext(ctx)
	var medicine *model.Medicine
	err := context_.Database.Where("id = ?", id).Find(&medicine).Error
	if err != nil {
		log.Println("Error occured: ", err)
		return nil, err
	}
	return medicine, nil
}

// Post is the resolver for the post field.
func (r *queryResolver) Post(ctx context.Context, id int) (*model.Post, error) {
	log.Println("Get Post Request! ID: ", id)
	context_ := common.GetContext(ctx)
	var post *model.Post
	err := context_.Database.Where("id = ?", id).Find(&post).Error
	if err != nil {
		log.Println("Error occured: ", err)
		return nil, err
	}
	return post, nil
}

// FilterMedicine is the resolver for the filter_medicine field.
func (r *queryResolver) FilterMedicine(ctx context.Context, name string) ([]*model.Medicine, error) {
	log.Println("Filter Post Request! substring: ", name)
	context_ := common.GetContext(ctx)
	var medicines []*model.Medicine
	search := "%" + name + "%"
	context_.Database.Where("name like ?", search).First(&medicines)
	return medicines, nil
}

// Mutation returns MutationResolver implementation.
func (r *Resolver) Mutation() MutationResolver { return &mutationResolver{r} }

// Query returns QueryResolver implementation.
func (r *Resolver) Query() QueryResolver { return &queryResolver{r} }

type mutationResolver struct{ *Resolver }
type queryResolver struct{ *Resolver }
