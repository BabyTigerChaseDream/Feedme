func exeCmd(cmdline string, output string, wg *sync.WaitGroup) {
    // fmt.Println("Start execCmd() ")
    cmd :=GenCmd(cmdline)
    // check if assigned output file
    if output != "" { 
        f, err := os.Create(output)
        if err != nil {
            log.Fatal(err)
        }
        defer f.Close()
        cmd.Stdout = f // set stdout to short-response.json
        err = cmd.Run()
        if err != nil {
            log.Fatal(err)
        }
        // Reopen file, copy to stdout confirm cmdline output is there
        // f.Close()
        // f, _ = os.Open(output)
        // io.Copy(os.Stdout, f) 
    } else {
        out, err := cmd.Output()
        if err != nil {
          fmt.Printf("%s", err)
        }
        fmt.Printf("%s", out)
    }
    wg.Done() // signal to waitgroup this goroutine complete
}