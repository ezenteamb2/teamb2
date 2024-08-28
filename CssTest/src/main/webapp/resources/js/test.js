$(function(){
	
	/* 태그 선택 */  
	$(".Schedule_div").on("click",function(){
		$(".Schedule_div").css("color","#009c75");
		$(".Real_Time_div").css("color","black");
	});
	
	$(".Real_Time_div").on("click",function(){
		$(".Real_Time_div").css("color","#009c75");
		$(".Schedule_div").css("color","black");
	});



	
	/* 출발시간 선택 */
	$(".select_seat_div").on("click",function(){
		$(".select_startTimeBox").css("display","block");
		$(".select_endTimeBox").css("display","none");
		$(".select_startBox").css("display","none");
		$(".date_selectBox").css("display","none");
		$(".select_endBox").css("display","none");
		
		$(".startTime_tag").on("click",function(){
		
			let startTime_tag = document.querySelectorAll('.startTime_tag');
			
			for (let i = 0; i < startTime_tag.length; i++) {
				let tagTime = document.querySelector('#tagTime'+ i);
	        	startTime_tag[i].addEventListener("click", () => {
	        		if(i <= 9) {
	        			$(".select_seat").text("0" + i + ":00");
	        			$(".select_startTimeBox").css("display","none");
	        		} else {
	        			$(".select_seat").text(i + ":00");
		        		$(".select_startTimeBox").css("display","none");
	        		}
	        	});
	        };

		});
		
		$(".startTimeBox_close").on("click",function(){
			$(".select_startTimeBox").css("display","none");
		});
		
		
	});
	

	/* 종료시간 선택 */
	$(".select_seat_div2").on("click",function(){
		$(".select_endTimeBox").css("display","block");
		$(".select_startBox").css("display","none");
		$(".select_startTimeBox").css("display","none");
		$(".date_selectBox").css("display","none");
		$(".select_endBox").css("display","none");
		
		$(".endTime_tag").on("click",function(){
			
			let endTime_tag = document.querySelectorAll('.endTime_tag');
			
			for (let i = 0; i < endTime_tag.length; i++) {
				let etagTime = document.querySelector('#etagTime'+ i);
				endTime_tag[i].addEventListener("click", () => {
					if(i <= 9) {
						$(".select_endTime").text("0" + i + ":59");
						$(".select_endTimeBox").css("display","none");
					} else {
						$(".select_endTime").text(i + ":59");
						$(".select_endTimeBox").css("display","none");						
					}
	        	});
	        };
		
		});
		
		$(".endTimeBox_close").on("click",function(){
				$(".select_endTimeBox").css("display","none");
		});
		
	});
	
	
	/* 날짜 선택 */
	$(".select_day_div").on("click",function(){
		$(".date_selectBox").css("display","block");
		$(".select_startBox").css("display","none");
		$(".select_startTimeBox").css("display","none");
		$(".select_endTimeBox").css("display","none");
		$(".select_endBox").css("display","none");
	});
	
	$(".date_seleteBox_close").on("click",function(){
		$(".date_selectBox").css("display","none");
	})
	
	/* 달력 */
	const init = {
		  monList: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		  dayList: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
		  today: new Date(),
		  monForChange: new Date().getMonth(),
		  activeDate: new Date(),
		  getFirstDay: (yy, mm) => new Date(yy, mm, 1),
		  getLastDay: (yy, mm) => new Date(yy, mm + 1, 0),
		  nextMonth: function () {
		    let d = new Date();
		    d.setDate(1);
		    d.setMonth(++this.monForChange);
		    this.activeDate = d;
		    return d;
		  },
		  prevMonth: function () {
		    let d = new Date();
		    d.setDate(1);
		    d.setMonth(--this.monForChange);
		    this.activeDate = d;
		    return d;
		  },
		  addZero: (num) => (num < 10) ? '0' + num : num,
		  activeDTag: null,
		  getIndex: function (node) {
		    let index = 0;
		    while (node = node.previousElementSibling) {
		      index++;
		    }
		    return index;
		  }
		};

		const $calBody = document.querySelector('.cal-body');
		const $btnNext = document.querySelector('.btn-cal.next');
		const $btnPrev = document.querySelector('.btn-cal.prev');

		/**
		 * @param {number} date
		 * @param {number} dayIn
		*/
		function loadDate (date, dayIn) {
		  document.querySelector('.cal-date').textContent = date;
		  document.querySelector('.cal-day').textContent = init.dayList[dayIn];
		}

		/**
		 * @param {date} fullDate
		 */
		function loadYYMM (fullDate) {
		  let yy = fullDate.getFullYear();
		  let mm = fullDate.getMonth();
		  let firstDay = init.getFirstDay(yy, mm);
		  let lastDay = init.getLastDay(yy, mm);
		  let markToday;  // for marking today date
		  
		  let today = init.today;
		  let rangeEnd = new Date(today);
		  rangeEnd.setDate(today.getDate() + 6);
		  
		  if (mm === init.today.getMonth() && yy === init.today.getFullYear()) {
		    markToday = init.today.getDate();
		  }
		  
		  document.querySelector('.cal-month').textContent = init.monList[mm];
		  document.querySelector('.cal-year').textContent = yy;

		  let trtd = '';
		  let startCount;
		  let countDay = 0;
		  for (let i = 0; i < 6; i++) {
		    trtd += '<tr>';
		    for (let j = 0; j < 7; j++) {
		      if (i === 0 && !startCount && j === firstDay.getDay()) {
		        startCount = 1;
		      }
		      if (!startCount) {
		        trtd += '<td>'
		      } else {
	                let currentDate = new Date(yy, mm, countDay + 1);
	                let fullDateStr = `${yy}.${init.addZero(mm + 1)}.${init.addZero(countDay + 1)}`;
	                let isPast = currentDate < new Date(today.getFullYear(), today.getMonth(), today.getDate());
	                let isInRange = currentDate >= today && currentDate <= rangeEnd;
	                let isDisabled = currentDate > rangeEnd;

	                trtd += `<td class="day${isPast ? ' disabled' : (isInRange ? ' selectable' : (isDisabled ? ' disabled' : ''))}`;
	                trtd += (markToday && markToday === countDay + 1) ? ' today"' : '"';
	                trtd += ` data-date="${countDay + 1}" data-fdate="${fullDateStr}">`;
		      }
		      trtd += (startCount) ? ++countDay : '';
		      if (countDay === lastDay.getDate()) { 
		        startCount = 0; 
		      }
		      trtd += '</td>';
		    }
		    trtd += '</tr>';
		  }
		  $calBody.innerHTML = trtd;
		}

			/**
			 * @param {string} val
			 */
			function createNewList (val) {
			  let id = new Date().getTime() + '';
			  let yy = init.activeDate.getFullYear();
			  let mm = init.activeDate.getMonth() + 1;
			  let dd = init.activeDate.getDate();
			  const $target = $calBody.querySelector(`.day[data-date="${dd}"]`);

			  let date = yy + '.' + init.addZero(mm) + '.' + init.addZero(dd);

			  let eventData = {};
			  eventData['date'] = date;
			  eventData['memo'] = val;
			  eventData['complete'] = false;
			  eventData['id'] = id;
			  init.event.push(eventData);
			  $todoList.appendChild(createLi(id, val, date));
			}

			loadYYMM(init.today);
			loadDate(init.today.getDate(), init.today.getDay());

			$btnNext.addEventListener('click', () => loadYYMM(init.nextMonth()));
			$btnPrev.addEventListener('click', () => loadYYMM(init.prevMonth()));

			$calBody.addEventListener('click', (e) => {
			  if (e.target.classList.contains('day') && !e.target.classList.contains('disabled')) {
			    if (init.activeDTag) {
			      init.activeDTag.classList.remove('day-active');
			    }
			    let day = Number(e.target.textContent);
			    loadDate(day, e.target.cellIndex);
			    e.target.classList.add('day-active');
			    init.activeDTag = e.target;
			    init.activeDate.setDate(day);
			    
			    const selectedDate = `${init.activeDate.getFullYear()}${init.addZero(init.activeDate.getMonth() + 1)}${init.addZero(day)}`;
			    const selectedDayOfWeek = init.dayList[e.target.cellIndex];
			    
			    document.querySelector('#selected-date').value = selectedDate;
			    document.querySelector('#selected-day').value = selectedDayOfWeek;
			    
			    console.log(selectedDate);
			    console.log(selectedDayOfWeek);

			    let selectedMonth = $(".cal-month").text();
			    let selectedDay = $(".day-active").text();
			 	$(".select_day").text( selectedMonth + selectedDay + "일" );
			 	$(".date_selectBox").css("display","none");
			 	
			  }
			});
					
				
		
				
	/* 출발지 선택 */
	$(".select_startDiv").on("click",function(){
		$(".select_startBox").css("display","block");
		$(".select_startTimeBox").css("display","none");
		$(".select_endTimeBox").css("display","none");
		$(".date_selectBox").css("display","none");
		$(".select_endBox").css("display","none");
				
	$(".startBox_close").on("click", function(){
		$(".select_startBox").css("display","none");
	});
		
	
	
	/* 대한민국 태그 */
	$("#Korea_start").on("click",function(){
		$("#Korea_start").css("border","1px solid #009C75");
		$("#Korea_start").css("background","#e9fbf7");
		$("#Korea").css("display","inline-block");
		
		$("#Southeast_Asia_start").css("border","0px");
		$("#Southeast_Asia_start").css("background","white");
		$("#Middle_East_start").css("border","0px");
		$("#Middle_East_start").css("background","white");
		$("#Oceania_start").css("border","0px");
		$("#Oceania_start").css("background","white");
		$("#Americas_start").css("border","0px");
		$("#Americas_start").css("background","white");
		$("#Europe_start").css("border","0px");
		$("#Europe_start").css("background","white");
		$("#China_start").css("border","0px");
		$("#China_start").css("background","white");
		$("#Japan_start").css("border","0px");
		$("#Japan_start").css("background","white");
		$("#Southeast_Asia").css("display","none");
		$("#Japan").css("display","none");
		$("#China").css("display","none");
		$("#Europe").css("display","none");
		$("#Americas").css("display","none");
		$("#Oceania").css("display","none");
		$("#Middle_East").css("display","none");
		
	});
	
	/* 동남아 태그 */
	if($(".select_people").text() == "인천" || $(".select_people").text() == "김포" || $(".select_people").text() == "김해" ||
			$(".select_people").text() == "제주" || $(".select_people").text() == "목적지 선택") {
		$("#Southeast_Asia_start").css("visibility", "visible");
		$("#Southeast_Asia_start").on("click",function(){
			$("#Southeast_Asia_start").css("border","1px solid #009C75");
			$("#Southeast_Asia_start").css("background","#e9fbf7");
			$("#Southeast_Asia").css("display","inline-block");
			
			$("#Korea_start").css("border","0px");
			$("#Korea_start").css("background","white");
			$("#Korea").css("display","none");
			$("#Middle_East_start").css("border","0px");
			$("#Middle_East_start").css("background","white");
			$("#Oceania_start").css("border","0px");
			$("#Oceania_start").css("background","white");
			$("#Americas_start").css("border","0px");
			$("#Americas_start").css("background","white");
			$("#Europe_start").css("border","0px");
			$("#Europe_start").css("background","white");
			$("#China_start").css("border","0px");
			$("#China_start").css("background","white");
			$("#Japan_start").css("border","0px");
			$("#Japan_start").css("background","white");
			$("#Japan").css("display","none");
			$("#China").css("display","none");
			$("#Europe").css("display","none");
			$("#Americas").css("display","none");
			$("#Oceania").css("display","none");
			$("#Middle_East").css("display","none");
			
		});
	}
	else {
		$("#Southeast_Asia_start").css("visibility", "hidden");
	}
	
	   
	/* 일본태그 */
	if($(".select_people").text() == "인천" || $(".select_people").text() == "김포" || $(".select_people").text() == "김해" ||
			$(".select_people").text() == "제주" || $(".select_people").text() == "목적지 선택") {
		$("#Japan_start").css("visibility", "visible");
		$("#Japan_start").on("click",function(){
			$("#Japan_start").css("border","1px solid #009C75");
			$("#Japan_start").css("background","#e9fbf7");
			$("#Japan").css("display","inline-block");
			
			$("#Korea_start").css("border","0px");
			$("#Korea_start").css("background","white");
			$("#Korea").css("display","none");
			$("#Middle_East_start").css("border","0px");
			$("#Middle_East_start").css("background","white");
			$("#Oceania_start").css("border","0px");
			$("#Oceania_start").css("background","white");
			$("#Americas_start").css("border","0px");
			$("#Americas_start").css("background","white");
			$("#Europe_start").css("border","0px");
			$("#Europe_start").css("background","white");
			$("#China_start").css("border","0px");
			$("#China_start").css("background","white");
			$("#Southeast_Asia_start").css("border","0px");
			$("#Southeast_Asia_start").css("background","white");
			$("#Southeast_Asia").css("display","none");
			$("#China").css("display","none");
			$("#Europe").css("display","none");
			$("#Americas").css("display","none");
			$("#Oceania").css("display","none");
			$("#Middle_East").css("display","none");
		});		
	}
	else {
		$("#Japan_start").css("visibility", "hidden");
	}
	
	/* 중국태그 */
	if($(".select_people").text() == "인천" || $(".select_people").text() == "김포" || $(".select_people").text() == "김해" ||
			$(".select_people").text() == "제주" || $(".select_people").text() == "목적지 선택") {
		$("#China_start").css("visibility", "visible");
		$("#China_start").on("click",function(){
			$("#China_start").css("border","1px solid #009C75");
			$("#China_start").css("background","#e9fbf7");
			$("#China").css("display","inline-block");
			
			$("#Korea_start").css("border","0px");
			$("#Korea_start").css("background","white");
			$("#Korea").css("display","none");
			$("#Middle_East_start").css("border","0px");
			$("#Middle_East_start").css("background","white");
			$("#Oceania_start").css("border","0px");
			$("#Oceania_start").css("background","white");
			$("#Americas_start").css("border","0px");
			$("#Americas_start").css("background","white");
			$("#Europe_start").css("border","0px");
			$("#Europe_start").css("background","white");
			$("#Japan_start").css("border","0px");
			$("#Japan_start").css("background","white");
			$("#Southeast_Asia_start").css("border","0px");
			$("#Southeast_Asia_start").css("background","white");
			$("#Japan").css("display","none");
			$("#Southeast_Asia").css("display","none");
			$("#Europe").css("display","none");
			$("#Americas").css("display","none");
			$("#Oceania").css("display","none");
			$("#Middle_East").css("display","none");
		});
	}
	else {
		$("#China_start").css("visibility", "hidden");
	}
	
	/* 유럽태그 */
	if($(".select_people").text() == "인천" || $(".select_people").text() == "김포" || $(".select_people").text() == "김해" ||
			$(".select_people").text() == "제주" || $(".select_people").text() == "목적지 선택") {
		$("#Europe_start").css("visibility", "visible");
		$("#Europe_start").on("click",function(){
			$("#Europe_start").css("border","1px solid #009C75");
			$("#Europe_start").css("background","#e9fbf7");
			$("#Europe").css("display","inline-block");
			
			$("#Korea_start").css("border","0px");
			$("#Korea_start").css("background","white");
			$("#Korea").css("display","none");
			$("#Middle_East_start").css("border","0px");
			$("#Middle_East_start").css("background","white");
			$("#Oceania_start").css("border","0px");
			$("#Oceania_start").css("background","white");
			$("#Americas_start").css("border","0px");
			$("#Americas_start").css("background","white");
			$("#China_start").css("border","0px");
			$("#China_start").css("background","white");
			$("#Japan_start").css("border","0px");
			$("#Japan_start").css("background","white");
			$("#Southeast_Asia_start").css("border","0px");
			$("#Southeast_Asia_start").css("background","white");
			$("#Japan").css("display","none");
			$("#China").css("display","none");
			$("#Southeast_Asia").css("display","none");
			$("#Americas").css("display","none");
			$("#Oceania").css("display","none");
			$("#Middle_East").css("display","none");
		});
	}
	else {
		$("#Europe_start").css("visibility", "hidden");
	}
	
	/* 미주 */
	if($(".select_people").text() == "인천" || $(".select_people").text() == "김포" || $(".select_people").text() == "김해" ||
			$(".select_people").text() == "제주" || $(".select_people").text() == "목적지 선택") {
		$("#Americas_start").css("visibility", "visible");
		$("#Americas_start").on("click",function(){
			$("#Americas_start").css("border","1px solid #009C75");
			$("#Americas_start").css("background","#e9fbf7");
			$("#Americas").css("display","inline-block");
			
			$("#Korea_start").css("border","0px");
			$("#Korea_start").css("background","white");
			$("#Korea").css("display","none");
			$("#Middle_East_start").css("border","0px");
			$("#Middle_East_start").css("background","white");
			$("#Oceania_start").css("border","0px");
			$("#Oceania_start").css("background","white");
			$("#Europe_start").css("border","0px");
			$("#Europe_start").css("background","white");
			$("#China_start").css("border","0px");
			$("#China_start").css("background","white");
			$("#Japan_start").css("border","0px");
			$("#Japan_start").css("background","white");
			$("#Southeast_Asia_start").css("border","0px");
			$("#Southeast_Asia_start").css("background","white");
			$("#Japan").css("display","none");
			$("#China").css("display","none");
			$("#Europe").css("display","none");
			$("#Southeast_Asia").css("display","none");
			$("#Oceania").css("display","none");
			$("#Middle_East").css("display","none");
		});
	}	
	else {
		$("#Americas_start").css("visibility", "hidden");
	}
	/* 대양주 */
	if($(".select_people").text() == "인천" || $(".select_people").text() == "김포" || $(".select_people").text() == "김해" ||
			$(".select_people").text() == "제주" || $(".select_people").text() == "목적지 선택") {
		$("#Oceania_start").css("visibility", "visible");
		$("#Oceania_start").on("click",function(){
			$("#Oceania_start").css("border","1px solid #009C75");
			$("#Oceania_start").css("background","#e9fbf7");
			$("#Oceania").css("display","inline-block");      
			
			$("#Korea_start").css("border","0px");
			$("#Korea_start").css("background","white");
			$("#Korea").css("display","none");
			$("#Middle_East_start").css("border","0px");
			$("#Middle_East_start").css("background","white");
			$("#Americas_start").css("border","0px");
			$("#Americas_start").css("background","white");
			$("#Europe_start").css("border","0px");
			$("#Europe_start").css("background","white");
			$("#China_start").css("border","0px");
			$("#China_start").css("background","white");
			$("#Japan_start").css("border","0px");
			$("#Japan_start").css("background","white");
			$("#Southeast_Asia_start").css("border","0px");
			$("#Southeast_Asia_start").css("background","white");
			$("#Japan").css("display","none");
			$("#China").css("display","none");
			$("#Europe").css("display","none");
			$("#Americas").css("display","none");
			$("#Southeast_Asia").css("display","none");
			$("#Middle_East").css("display","none");
		});
	}
	else {
		$("#Oceania_start").css("visibility", "hidden");
	}
	
	/* 중동,아프리카 */
	if($(".select_people").text() == "인천" || $(".select_people").text() == "김포" || $(".select_people").text() == "김해" ||
			$(".select_people").text() == "제주" || $(".select_people").text() == "목적지 선택") {
		$("#Middle_East_start").css("visibility", "visible");
		$("#Middle_East_start").on("click",function(){
			$("#Middle_East_start").css("border","1px solid #009C75");
			$("#Middle_East_start").css("background","#e9fbf7");
			$("#Middle_East").css("display","inline-block");
			
			$("#Korea_start").css("border","0px");
			$("#Korea_start").css("background","white");
			$("#Korea").css("display","none");
			$("#Oceania_start").css("border","0px");
			$("#Oceania_start").css("background","white");
			$("#Americas_start").css("border","0px");
			$("#Americas_start").css("background","white");
			$("#Europe_start").css("border","0px");
			$("#Europe_start").css("background","white");
			$("#China_start").css("border","0px");
			$("#China_start").css("background","white");
			$("#Japan_start").css("border","0px");
			$("#Japan_start").css("background","white");
			$("#Southeast_Asia_start").css("border","0px");
			$("#Southeast_Asia_start").css("background","white");
			$("#Japan").css("display","none");
			$("#China").css("display","none");
			$("#Europe").css("display","none");
			$("#Americas").css("display","none");
			$("#Oceania").css("display","none");
			$("#Southeast_Asia").css("display","none");
		});
	}
	else {
		$("#Middle_East_start").css("visibility", "hidden");
	}
	
	
	/* 출발지 클릭 시  */
	if($(".select_people").text() == "인천" || $(".select_people").text() == "김포" || $(".select_people").text() == "김해" ||
			$(".select_people").text() == "제주" || $(".select_people").text() == "목적지 선택") {
		for(let i = 1; i <= 96; i++){
			$("#selectcity_"+i).on("click",function(){
				$(".start_result").text($("#selectcity_"+i).text());
				$(".select_startBox").css("display","none");
			})
		}
	} else {
		for(let i = 1; i <= 4; i++){
			$("#selectcity_"+i).on("click",function(){
				$(".start_result").text($("#selectcity_"+i).text());
				$(".select_startBox").css("display","none");
			})
		}
	}
	
	});
	
	
	
	
	/* 목적지 선택 */
	$(".select_people_div").on("click",function(){
		$(".select_endBox").css("display","block");
		$(".date_selectBox").css("display","none");
		$(".select_startBox").css("display","none");
		$(".select_startTimeBox").css("display","none");
		$(".select_endTimeBox").css("display","none");
		
	$(".select_endBox_close").on("click",function(){
		$(".select_endBox").css("display","none");
	})
	
	/* 대한민국 태그 */
	$("#Korea_tag").on("click",function(){
		$("#Korea_tag").css("border","1px solid #009C75");
		$("#Korea_tag").css("background","#e9fbf7");
		$("#Korea_div").css("display","inline-block");
		
		$("#Southeast_Asia_tag").css("border","0px");
		$("#Southeast_Asia_tag").css("background","white");
		$("#Southeast_Asia_div").css("display","none");
		$("#Middle_East_tag").css("border","0px");
		$("#Middle_East_tag").css("background","white");
		$("#Oceania_tag").css("border","0px");
		$("#Oceania_tag").css("background","white");
		$("#Americas_tag").css("border","0px");
		$("#Americas_tag").css("background","white");
		$("#europe_tag").css("border","0px");
		$("#europe_tag").css("background","white");
		$("#china_tag").css("border","0px");
		$("#china_tag").css("background","white");
		$("#japan_tag").css("border","0px");
		$("#japan_tag").css("background","white");
		$("#japan_div").css("display","none");
		$("#china_div").css("display","none");
		$("#europe_div").css("display","none");
		$("#Americas_div").css("display","none");
		$("#Oceania_div").css("display","none");
		$("#Middle_East_div").css("display","none");
		
	});
	
	/* 동남아 태그 */
	if($(".start_result").text() == "인천" || $(".start_result").text() == "김포" || $(".start_result").text() == "김해" ||
			$(".start_result").text() == "제주" || $(".start_result").text() == "출발지 선택") {
		$("#Southeast_Asia_tag").css("visibility", "visible");
		$("#Southeast_Asia_tag").on("click",function(){
			$("#Southeast_Asia_tag").css("border","1px solid #009C75");
			$("#Southeast_Asia_tag").css("background","#e9fbf7");
			$("#Southeast_Asia_div").css("display","inline-block");
			
			$("#Korea_tag").css("border","0px");
			$("#Korea_tag").css("background","white");
			$("#Korea_div").css("display","none");
			$("#Middle_East_tag").css("border","0px");
			$("#Middle_East_tag").css("background","white");
			$("#Oceania_tag").css("border","0px");
			$("#Oceania_tag").css("background","white");
			$("#Americas_tag").css("border","0px");
			$("#Americas_tag").css("background","white");
			$("#europe_tag").css("border","0px");
			$("#europe_tag").css("background","white");
			$("#china_tag").css("border","0px");
			$("#china_tag").css("background","white");
			$("#japan_tag").css("border","0px");
			$("#japan_tag").css("background","white");
			$("#japan_div").css("display","none");
			$("#china_div").css("display","none");
			$("#europe_div").css("display","none");
			$("#Americas_div").css("display","none");
			$("#Oceania_div").css("display","none");
			$("#Middle_East_div").css("display","none");
			
		});
	}
	else {
		$("#Southeast_Asia_tag").css("visibility", "hidden");
	}
	   
	/* 일본태그 */
	if($(".start_result").text() == "인천" || $(".start_result").text() == "김포" || $(".start_result").text() == "김해" ||
			$(".start_result").text() == "제주" || $(".start_result").text() == "출발지 선택") {
		$("#japan_tag").css("visibility", "visible");
		$("#japan_tag").on("click",function(){
			$("#japan_tag").css("border","1px solid #009C75");
			$("#japan_tag").css("background","#e9fbf7");
			$("#japan_div").css("display","inline-block");
			
			$("#Korea_tag").css("border","0px");
			$("#Korea_tag").css("background","white");
			$("#Korea_div").css("display","none");
			$("#Middle_East_tag").css("border","0px");
			$("#Middle_East_tag").css("background","white");
			$("#Oceania_tag").css("border","0px");
			$("#Oceania_tag").css("background","white");
			$("#Americas_tag").css("border","0px");
			$("#Americas_tag").css("background","white");
			$("#europe_tag").css("border","0px");
			$("#europe_tag").css("background","white");
			$("#china_tag").css("border","0px");
			$("#china_tag").css("background","white");
			$("#Southeast_Asia_tag").css("border","0px");
			$("#Southeast_Asia_tag").css("background","white");
			$("#Southeast_Asia_div").css("display","none");
			$("#china_div").css("display","none");
			$("#europe_div").css("display","none");
			$("#Americas_div").css("display","none");
			$("#Oceania_div").css("display","none");
			$("#Middle_East_div").css("display","none");
		});
	}
	else {
		$("#japan_tag").css("visibility", "hidden");
	}
	
	/* 중국태그 */
	if($(".start_result").text() == "인천" || $(".start_result").text() == "김포" || $(".start_result").text() == "김해" ||
			$(".start_result").text() == "제주" || $(".start_result").text() == "출발지 선택") {
		$("#china_tag").css("visibility", "visible");
		$("#china_tag").on("click",function(){
			$("#china_tag").css("border","1px solid #009C75");
			$("#china_tag").css("background","#e9fbf7");
			$("#china_div").css("display","inline-block");
			
			$("#Korea_tag").css("border","0px");
			$("#Korea_tag").css("background","white");
			$("#Korea_div").css("display","none");
			$("#Middle_East_tag").css("border","0px");
			$("#Middle_East_tag").css("background","white");
			$("#Oceania_tag").css("border","0px");
			$("#Oceania_tag").css("background","white");
			$("#Americas_tag").css("border","0px");
			$("#Americas_tag").css("background","white");
			$("#europe_tag").css("border","0px");
			$("#europe_tag").css("background","white");
			$("#japan_tag").css("border","0px");
			$("#japan_tag").css("background","white");
			$("#Southeast_Asia_tag").css("border","0px");
			$("#Southeast_Asia_tag").css("background","white");
			$("#japan_div").css("display","none");
			$("#Southeast_Asia_div").css("display","none");
			$("#europe_div").css("display","none");
			$("#Americas_div").css("display","none");
			$("#Oceania_div").css("display","none");
			$("#Middle_East_div").css("display","none");
		});
	}
	else {
		$("#china_tag").css("visibility", "hidden");
	}
	
	/* 유럽태그 */
	if($(".start_result").text() == "인천" || $(".start_result").text() == "김포" || $(".start_result").text() == "김해" ||
			$(".start_result").text() == "제주" || $(".start_result").text() == "출발지 선택") {
		$("#europe_tag").css("visibility", "visible");
		$("#europe_tag").on("click",function(){
			$("#europe_tag").css("border","1px solid #009C75");
			$("#europe_tag").css("background","#e9fbf7");
			$("#europe_div").css("display","inline-block");
			
			$("#Korea_tag").css("border","0px");
			$("#Korea_tag").css("background","white");
			$("#Korea_div").css("display","none");
			$("#Middle_East_tag").css("border","0px");
			$("#Middle_East_tag").css("background","white");
			$("#Oceania_tag").css("border","0px");
			$("#Oceania_tag").css("background","white");
			$("#Americas_tag").css("border","0px");
			$("#Americas_tag").css("background","white");
			$("#china_tag").css("border","0px");
			$("#china_tag").css("background","white");
			$("#japan_tag").css("border","0px");
			$("#japan_tag").css("background","white");
			$("#Southeast_Asia_tag").css("border","0px");
			$("#Southeast_Asia_tag").css("background","white");
			$("#japan_div").css("display","none");
			$("#china_div").css("display","none");
			$("#Southeast_Asia_div").css("display","none");
			$("#Americas_div").css("display","none");
			$("#Oceania_div").css("display","none");
			$("#Middle_East_div").css("display","none");
		});
	}
	else {
		$("#europe_tag").css("visibility", "hidden");
	}
	
	/* 미주 */
	if($(".start_result").text() == "인천" || $(".start_result").text() == "김포" || $(".start_result").text() == "김해" ||
			$(".start_result").text() == "제주" || $(".start_result").text() == "출발지 선택") {
		$("#Americas_tag").css("visibility", "visible");
		$("#Americas_tag").on("click",function(){
			$("#Americas_tag").css("border","1px solid #009C75");
			$("#Americas_tag").css("background","#e9fbf7");
			$("#Americas_div").css("display","inline-block");
			
			$("#Korea_tag").css("border","0px");
			$("#Korea_tag").css("background","white");
			$("#Korea_div").css("display","none");
			$("#Middle_East_tag").css("border","0px");
			$("#Middle_East_tag").css("background","white");
			$("#Oceania_tag").css("border","0px");
			$("#Oceania_tag").css("background","white");
			$("#europe_tag").css("border","0px");
			$("#europe_tag").css("background","white");
			$("#china_tag").css("border","0px");
			$("#china_tag").css("background","white");
			$("#japan_tag").css("border","0px");
			$("#japan_tag").css("background","white");
			$("#Southeast_Asia_tag").css("border","0px");
			$("#Southeast_Asia_tag").css("background","white");
			$("#japan_div").css("display","none");
			$("#china_div").css("display","none");
			$("#europe_div").css("display","none");
			$("#Southeast_Asia_div").css("display","none");
			$("#Oceania_div").css("display","none");
			$("#Middle_East_div").css("display","none");
		});
	}
	else {
		$("#Americas_tag").css("visibility", "hidden");
	}
	
	/* 대양주 */
	if($(".start_result").text() == "인천" || $(".start_result").text() == "김포" || $(".start_result").text() == "김해" ||
			$(".start_result").text() == "제주" || $(".start_result").text() == "출발지 선택") {
		$("#Oceania_tag").css("visibility", "visible");
		$("#Oceania_tag").on("click",function(){
			$("#Oceania_tag").css("border","1px solid #009C75");
			$("#Oceania_tag").css("background","#e9fbf7");
			$("#Oceania_div").css("display","inline-block");      
			
			$("#Korea_tag").css("border","0px");
			$("#Korea_tag").css("background","white");
			$("#Korea_div").css("display","none");
			$("#Middle_East_tag").css("border","0px");
			$("#Middle_East_tag").css("background","white");
			$("#Americas_tag").css("border","0px");
			$("#Americas_tag").css("background","white");
			$("#europe_tag").css("border","0px");
			$("#europe_tag").css("background","white");
			$("#china_tag").css("border","0px");
			$("#china_tag").css("background","white");
			$("#japan_tag").css("border","0px");
			$("#japan_tag").css("background","white");
			$("#Southeast_Asia_tag").css("border","0px");
			$("#Southeast_Asia_tag").css("background","white");
			$("#japan_div").css("display","none");
			$("#china_div").css("display","none");
			$("#europe_div").css("display","none");
			$("#Americas_div").css("display","none");
			$("#Southeast_Asia_div").css("display","none");
			$("#Middle_East_div").css("display","none");
		});
	}
	else {
		$("#Oceania_tag").css("visibility", "hidden");
	}
	
	/* 중동,아프리카 */
	if($(".start_result").text() == "인천" || $(".start_result").text() == "김포" || $(".start_result").text() == "김해" ||
			$(".start_result").text() == "제주" || $(".start_result").text() == "출발지 선택") {
		$("#Middle_East_tag").css("visibility", "visible");
		$("#Middle_East_tag").on("click",function(){
			$("#Middle_East_tag").css("border","1px solid #009C75");
			$("#Middle_East_tag").css("background","#e9fbf7");
			$("#Middle_East_div").css("display","inline-block");
			
			$("#Korea_tag").css("border","0px");
			$("#Korea_tag").css("background","white");
			$("#Korea_div").css("display","none");
			$("#Oceania_tag").css("border","0px");
			$("#Oceania_tag").css("background","white");
			$("#Americas_tag").css("border","0px");
			$("#Americas_tag").css("background","white");
			$("#europe_tag").css("border","0px");
			$("#europe_tag").css("background","white");
			$("#china_tag").css("border","0px");
			$("#china_tag").css("background","white");
			$("#japan_tag").css("border","0px");
			$("#japan_tag").css("background","white");
			$("#Southeast_Asia_tag").css("border","0px");
			$("#Southeast_Asia_tag").css("background","white");
			$("#japan_div").css("display","none");
			$("#china_div").css("display","none");
			$("#europe_div").css("display","none");
			$("#Americas_div").css("display","none");
			$("#Oceania_div").css("display","none");
			$("#Southeast_Asia_div").css("display","none");
		});
	}
	else {
		$("#Middle_East_tag").css("visibility", "hidden");
	}
	
	
	/* 목적지 클릭 시  */
	if($(".start_result").text() == "인천" || $(".start_result").text() == "김포" || $(".start_result").text() == "김해" ||
			$(".start_result").text() == "제주" || $(".start_result").text() == "출발지 선택") {
		for(let i = 1; i <= 96; i++){
			$("#citySelect_"+i).on("click",function(){
				$(".select_people").text($("#citySelect_"+i).text());
				$(".select_endBox").css("display","none");
			})
		}
	} else {
		for(let i = 1; i <= 4; i++){
			$("#citySelect_"+i).on("click",function(){
				$(".select_people").text($("#citySelect_"+i).text());
				$(".select_endBox").css("display","none");
			})
		}
	}
	
	});
	
	
	
	
	 //form submit
      $('.city_tag').on('click', function() {
        let arrivalCity = $(this).data('arrival');
        console.log(arrivalCity)
        $('#arrival-city').val(arrivalCity);
      });

      $('.start_city').on('click', function() {
        let departureCity = $(this).data('departure');
        console.log(departureCity);
        $('#departure-city').val(departureCity);
      });

      $('.startTime_tag').on('click', function() {
          const departureTime = $(this).data('start');
          console.log(departureTime);
          $('#selectedDepartureTime').val(departureTime);
      });

      $('.endTime_tag').on('click', function() {
          const arrivalTime = $(this).data('end');
          console.log(arrivalTime);
          $('#selectedArrivalTime').val(arrivalTime);
      });
		  
});