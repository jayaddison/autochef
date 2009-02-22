<jsp:useBean id="recipeBean" scope="request" class="autochef.www.content.RecipeBean" />

<strong>Preparation Timeline</strong>
<br />
<br />
<table id="timeline">
<tr>
<td colspan="2"><div id="timelinechart"><div></div></div></td>
<td><ul id="timelinekey"></ul></td>
</tr>
<tr>
<td style="border: none"><a onclick="starttimer()">start timer</a></td>
<td style="border: none"><a onclick="stoptimer()">stop timer</a></td>
<td style="border: none"><a onclick="resettimer()">reset timer</a></td>
</tr>
</table>
<br />

<strong>Nutritional Information</strong>
<div id="nutritioninfo" style="visibility: hidden">
<table>
<tr><td>Calories</td><td>80</td></tr>
<tr><td>Protein</td><td>5.1g</td></tr>
<tr><td>Fat</td><td>4.2g</td></tr>
</table>
</div>

<script>
var timerid = 0;
var timenow = 0;
window.onload = drawtimeline;

function drawtimeline()
{
    var colours = new Array("maroon", "darkgreen", "navy", "orange", "purple");
    var timelinechart = document.getElementById("timelinechart");
    var timelinekey = document.getElementById("timelinekey");

    for (var i = 0; i < steps.length; i++)
    {
        var start = starttimes[i];
        var remaining = (starttimes[i] > timenow ? durations[i] : starttimes[i] + durations[i] - timenow);
    }

    for (var i = 0; i < steps.length; i++)
    {
        var start = starttimes[i];
        var remaining = (starttimes[i] > timenow ? durations[i] : starttimes[i] + durations[i] - timenow);

        var emptybar = document.createElement("div");
        emptybar.style.height = (5 * start) + "px";
        emptybar.style.backgroundColor = "white";

        var progressbar = document.createElement("div");
        progressbar.style.height = "0px";
        progressbar.style.backgroundColor = "silver";

        var remainingbar = document.createElement("div");
        remainingbar.style.height = (5 * remaining) + "px";
        remainingbar.style.backgroundColor = colours[i];

        var ingredient = document.createElement("div");
        ingredient.appendChild(emptybar);
        ingredient.appendChild(progressbar);
        ingredient.appendChild(remainingbar);
        timelinechart.appendChild(ingredient);

        // this should probably be done server-side
        var keyText = document.createElement("div");
        keyText.appendChild(document.createTextNode(steps[i]));
        keyText.style.color = colours[i];
        keyText.style.fontSize = "11px";

        var key = document.createElement("li");
        key.style.color = colours[i];
        key.style.fontSize = "18px";
        key.appendChild(keyText);
        timelinekey.appendChild(key);

    }

    var totaltime = ${recipeBean.preparationTime};
    for (i = 0; (i * 5) <= totaltime + 5; i++)
    {
        var indicator = document.createElement("div");

        indicator.style.width = "6px";
        indicator.style.position = "relative";

        if (i % 6 == 0)
        {
            indicator.style.borderTop = "solid 2px gray";
        }
        else
        {
            indicator.style.borderTop = "solid 2px lightgray";
        }
        indicator.style.marginBottom = "3px";
        indicator.style.top = -1 + (5 * i * 4) + "px";

        timelinechart.childNodes[0].appendChild(indicator);
    }

    document.getElementById("timeline").style.height = ((5 * i * 5) + 30) + "px";
}

function redrawtimeline()
{
    var timelinechart = document.getElementById("timelinechart");
    for (var i = 1; i <= steps.length; i++)
    {
        var start = starttimes[i-1];
        var remaining = (starttimes[i-1] > timenow ? durations[i-1] : starttimes[i-1] + durations[i-1] - timenow);

        var ingredient = timelinechart.childNodes[i];
        var progressbar = ingredient.childNodes[1];
        var remainingbar = ingredient.childNodes[2];

        if (remaining >= 0)
        {
            progressbar.style.height = (5 * (timenow - start)) + "px";
        }
        if (timenow == 0)
        {
            progressbar.style.height = "0px";
        }
        remainingbar.style.height = (5 * remaining) + "px";
    }
}

function updatetimer()
{
    timenow++;
    redrawtimeline();
    timerid = setTimeout("updatetimer();", 1000);
}

function starttimer()
{
    timerid = setTimeout("updatetimer();", 1000);
}

function stoptimer()
{
    clearTimeout(timerid);
}

function resettimer()
{
    clearTimeout(timerid);
    timenow = 0;
    redrawtimeline();
}

function showtimeline()
{
    document.getElementById("timeline").style.visibility = "visible";
    document.getElementById("nutritioninfo").style.visibility = "hidden";
}

function shownutrition()
{
    document.getElementById("timeline").style.visibility = "hidden";
    document.getElementById("nutritioninfo").style.visibility = "visible";
}
</script>
