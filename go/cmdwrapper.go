package main

/* [SO] https://stackoverflow.com/a/20438245/4568140 */
import (
    "fmt"
    "log"
    "io"
    "os/exec"
    "os"
    "sync"
    "strings"
    // "time"
)
// debugging 
func loopArr(arr []string) {
    // using for loop
    for index, element := range arr {
        fmt.Println("At index", index, "value is", element)
    }
}

// command line parser , generate exec.Command
// cmd is same command line as running in shell(remove single quote)
func GenCmd(cmdline string) *exec.Cmd {
    fmt.Println("command is ",cmdline)
    // splitting head => g++ parts => rest of the command
    parts := strings.Fields(cmdline)

    // loopArr(parts)
    head := parts[0]
    parts = parts[1:len(parts)]
    
    // exec cmd & collect output
    cmd:= exec.Command(head,parts...)
    fmt.Printf("Generated comdline : %s", cmd)
    return cmd
  }

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

func main() {
    // x := []string{ "jq (.data.legacyCollection.collectionsPage.stream.edges|map({node:(.node|{url,firstPublished,headline:{default:.headline.default},summary})})) as $edges|{data:{legacyCollection:{collectionsPage:{stream:{$edges}}}}} nytimes-response.json", "ls -al" }
    // x := []string{"echo newline >> foo.o", "echo newline >> f1.o", "echo newline >> f2.o"}
    x:= make(map[string]string)
    x["echo newline >> foo.o"] = ""
    x["echo newline >> f1.o"] = "cmd1.txt"

    cmdCnt:=len(x)
    wg := new(sync.WaitGroup)
    wg.Add(cmdCnt)

    for cmd,output := range x{
        go exeCmd(cmd,output,wg) // empty string output to stdout
    }

    wg.Wait()
}

