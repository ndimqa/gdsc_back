package mail_sender

import (
	"log"
)

func Send(body string, to string, time string) {
	// TODO: https://gist.github.com/jpillora/cb46d183eca0710d909a
	log.Printf("sended mail: %s, to: %s : Time: $", body, to, time)
}
