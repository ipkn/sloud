sloud
=====

Slides over Cloud. from markdown to presentation with files in dropbox

How to write?
-------------

각각의 슬라이드는 ---로 구분되어진다.

한 슬라이드의 구성 :

	options
	slide body  
	~~~  
	slide note  

options와 slide note는 생략가능하다.

options
-------

  -	global:no-transition
  
  		슬라이드 전환을 없앤다

  -	title
  	
		해당 슬라이드를 타이틀 슬라이드로 만든다.
		#, ##, ### 으로 제목, 소제목, 저자를 작성가능

  -	no-background

  		해당 슬라이드의 배경을 없앤다.

  -	two-column

  		해당 슬라이드에 이중 칼럼을 사용한다

  - border

  		해당 슬라이드에 테두리를 표시한다

  - class:classA,classB,...

  		해당 슬라이드에 HTML class 값을 부여한다. `<style>` 태그 등을 이용하여 꾸밀때 사용한다.

  - id:slide-id

  		해당 슬라이드에 HTML id 값을 부여한다.
