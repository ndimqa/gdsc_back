package google_services

import (
	"context"
	"gdsc.back/graph/model"
	"golang.org/x/oauth2/google"
	"google.golang.org/api/option"
	"google.golang.org/api/sheets/v4"
	"log"
	"os"
)

func CreateSpreadSheet(email string) string {
	ctx := context.Background()
	b, err := os.ReadFile("google_services/credentials.json")
	if err != nil {
		log.Println("Unable to read client secret file: %v", err)
	}
	log.Println("1")
	// If modifying these scopes, delete your previously saved token.json.
	config, err := google.ConfigFromJSON(b, "https://www.googleapis.com/auth/spreadsheets")
	if err != nil {
		log.Println("Unable to parse client secret file to config: %v", err)
	}
	log.Println("2")
	client := getClient(config, "sheet_token.json")

	srv, err := sheets.NewService(ctx, option.WithHTTPClient(client))
	if err != nil {
		log.Println("Unable to retrieve Sheets client: %v", err)
	}
	log.Println("3")
	spreadsheet := &sheets.Spreadsheet{
		Properties: &sheets.SpreadsheetProperties{
			Title: email,
		},
	}
	log.Println("4")
	res, err := srv.Spreadsheets.Create(spreadsheet).Context(ctx).Do()
	log.Println("5")
	if err != nil {
		log.Fatal(err)
	}
	log.Println("6")
	row := &sheets.ValueRange{
		Values: [][]interface{}{{"date", "bpm", "pressure", "saturation", "weight", "temperature"}},
	}
	log.Println("7")
	response2, err := srv.Spreadsheets.Values.Append(res.SpreadsheetId, res.Properties.Title, row).ValueInputOption("USER_ENTERED").InsertDataOption("INSERT_ROWS").Context(ctx).Do()
	if err != nil || response2.HTTPStatusCode != 200 {
		log.Println(err)
	}
	log.Println("8")
	return res.SpreadsheetId
}

func SetMetricToSpreadSheet(SpreadsheetId string, metric *model.NewMetric) bool {
	ctx := context.Background()
	b, err := os.ReadFile("google_services/credentials.json")
	if err != nil {
		log.Println("Unable to read client secret file: %v", err)
	}

	// If modifying these scopes, delete your previously saved token.json.
	config, err := google.ConfigFromJSON(b, "https://www.googleapis.com/auth/spreadsheets")
	if err != nil {
		log.Println("Unable to parse client secret file to config: %v", err)
	}
	client := getClient(config, "sheet_token.json")

	srv, err := sheets.NewService(ctx, option.WithHTTPClient(client))
	if err != nil {
		log.Println("Unable to retrieve Sheets client: %v", err)
	}

	response1, err := srv.Spreadsheets.Get(SpreadsheetId).Fields("sheets(properties(sheetId,title))").Do()
	if err != nil || response1.HTTPStatusCode != 200 {
		log.Println("Unable to read client secret file: %v", err)
	}

	sheetName := ""
	for _, v := range response1.Sheets {
		prop := v.Properties
		if prop.SheetId == int64(0) {
			sheetName = prop.Title
			break
		}
	}

	//Append value to the sheet.
	row := &sheets.ValueRange{
		Values: [][]interface{}{{metric.Date, metric.Bpm, metric.Pressure, metric.Saturation, metric.Weight, metric.Temperature}},
	}

	response2, err := srv.Spreadsheets.Values.Append(SpreadsheetId, sheetName, row).ValueInputOption("USER_ENTERED").InsertDataOption("INSERT_ROWS").Context(ctx).Do()
	if err != nil || response2.HTTPStatusCode != 200 {
		log.Println("Unable to read client secret file: %v", err)
	}
	return true
}
