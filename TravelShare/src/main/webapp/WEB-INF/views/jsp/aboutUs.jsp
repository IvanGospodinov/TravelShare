<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</script>
<script>
$(document).ready(function(){
    $("button").click(function(){
        $("p").hide();
    });
});
</script>
</head>
<body>

<h2>This is a heading</h2>

<p>This is a paragraph.</p>
<p>This is another paragraph.</p>


<ul id="orders">
	<li>Like</li>
	<li>dislike</li>

</ul>
<button id="btn">Click</button>


<script type="text/javascript">
var $orders = $('#orders');	
function addOrder(order) {
	$orders.append('<li>name ' + order + '</li>');	
}

/* $(function () { */
		
	
	
/* 	$.ajax({	
		type: 'GET',
		url: '/TravelShare/aboutt',
		success: function(orders) {
			
			$.each(orders, function(i, order)  {
				addOrder(order)		
			}) 
		}		
	})		
}); */

	$('#btn').on('click', function() {
		$.ajax({	
			type: 'GET',
			url: '/TravelShare/aboutt',
			success: function(orders) {
				
				$.each(orders, function(i, order)  {
					addOrder(order)		
				}) 
			}		
		})		
	});



</script>

</body>
</html>
