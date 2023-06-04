package google_services

import (
	"context"
	"crypto/rand"
	"encoding/base64"
	"fmt"
	"gdsc.back/graph/model"
	"golang.org/x/oauth2/google"
	"google.golang.org/api/calendar/v3"
	"google.golang.org/api/option"
	"log"
	"os"
)

func generateRandomString(length int) string {
	b := make([]byte, length)
	_, err := rand.Read(b)
	if err != nil {
		panic(err)
	}
	return base64.StdEncoding.EncodeToString(b)
}

func CreateAppointment(appointment *model.Appointment) bool {

	fmt.Println("1")
	ctx := context.Background()
	fmt.Println("2")
	b, err := os.ReadFile("google_services/credentials.json")
	if err != nil {
		log.Fatalf("Unable to read client secret file: %v", err)
	}
	fmt.Println("3")
	// If modifying these scopes, delete your previously saved token.json.
	config, err := google.ConfigFromJSON(b, calendar.CalendarScope)
	fmt.Println(config.Scopes)
	if err != nil {
		fmt.Println("Unable to parse client secret file to config: %v", err)
	}
	fmt.Println("4")
	client := getClient(config, "token.json")
	srv, err := calendar.NewService(ctx, option.WithHTTPClient(client))
	if err != nil {
		fmt.Println("Unable to retrieve Calendar client: %v", err)
	}
	date := appointment.DayMonthYear + "T" + appointment.Time
	end_date := appointment.DayMonthYear + "T" + appointment.EndTime
	event := &calendar.Event{
		Summary:     "Appointment",
		Location:    "",
		Description: "This is the test description",
		Start: &calendar.EventDateTime{
			DateTime: date,
			TimeZone: "Asia/Almaty",
		},
		End: &calendar.EventDateTime{
			DateTime: end_date,
			TimeZone: "Asia/Almaty",
		},
		Recurrence: []string{},
		Attendees: []*calendar.EventAttendee{
			&calendar.EventAttendee{Email: appointment.UserMail},
			&calendar.EventAttendee{Email: appointment.DoctorsMail},
		},
		ConferenceData: &calendar.ConferenceData{
			CreateRequest: &calendar.CreateConferenceRequest{
				RequestId: generateRandomString(5),
			},
		},
	}

	calendarId := "primary"

	event, err = srv.Events.Insert(calendarId, event).Do()
	if err != nil {
		fmt.Println("Unable to create event. %v\n", err)
	}
	//fmt.Println("Event created: %s\n", event.HtmlLink)

	return true
}
