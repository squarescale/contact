package main

import (
	"fmt"
	"os"

	"github.com/CrowdSurge/banner"
	"github.com/olekukonko/tablewriter"
)

func main() {
	showBanner()

	showSqsc()
}

func showBanner() {
	banner.Print("squarescale")
	fmt.Println("")
}

func showSqsc() {
	data := [][]string{
		[]string{"Your Cloud Native Infrastructure as a Service.\nFrom Development Workflow to Production"},
	}
	table := tablewriter.NewWriter(os.Stdout)
	table.SetHeader([]string{"SquareScale"})
	table.AppendBulk(data)
	table.SetBorder(false)
	table.SetColumnSeparator(" ")
	table.Render()

	fmt.Println("")

	data = [][]string{
		[]string{"www", "https://www.squarescale.com"},
		[]string{"Email", "contact@squarescale.com"},
		[]string{"Twitter", "https://twitter.com/sqscale"},
		[]string{"Github", "https://github.com/squarescale"},
		[]string{"Tel", "+33(0)411-934-340"},
		[]string{"Locations", "Montréal, Canada"},
		[]string{"Locations", "Grenoble, France"},
	}
	table = tablewriter.NewWriter(os.Stdout)
	table.SetBorder(false)
	table.SetColumnSeparator(":")
	table.SetAutoMergeCells(true)
	table.AppendBulk(data)
	table.Render()

	fmt.Println("")
}
