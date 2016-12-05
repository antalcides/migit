Pkg.add("Plotly")
using Plotly
username=""
api_key=""
Plotly.signin(username, api_key)
data0 = ["x" => x, "type" => "histogramx", "histnorm" => "probability density"]
data1 = ["x" => xp["x"],"y" => xp["dens"], "type" => "scatter"]
layout = {
  "title"=> "PDF",
  "autosize"=> "false",
  "width"=> 700,
  "height"=> 700,
  "titlefont"=>

          {
           "family"=> "Open Sans",
           "size"=> 18,
           "color"=> "rgb(84, 39, 143)"
           },
  "margin"=> {"l"=>160, "pad"=>0},
          "xaxis"=> {
                     "title"=> "x"
                     },
  "yaxis"=> {"title"=> "Density"},
  "showlegend" => false
          };
response = Plotly.plot([data0, data1],["layout"=>layout])
url = response["url"]
url = replace(url,"http","https")
s = string("<iframe height='750' id='igraph' scrolling='no' seamless='seamless' src='",
            url,
            "/700/700' width='750'></iframe>")
display("text/html", s);
