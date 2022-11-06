type Holiday = { office_code: number, date: string, year: number };

const holidayList: Holiday[] = [];

for (let office_code = 1; office_code <= 3; office_code++) {
    let first_holiday = 0;
    let second_holiday = 1;
    if (office_code === 2) {
        first_holiday = 2;
        second_holiday = 3;
    } else if (office_code === 3) {
        first_holiday = 4;
        second_holiday = 5;
    }
    for (let month = 10; month <= 12; month++) {
        const day_cnt = new Date(month === 12 ? 2023 : 2022, month === 12 ? 1 : month + 1, 0).getDate();
        for (let day = 1; day <= day_cnt; day++) {

            const date = new Date(`2022-${month}-${String(day).padStart(2, '0')}T00:00:00.000Z`);
            const week = date.getDay();
            if (week === first_holiday || week === second_holiday) {
                const data: Holiday = {
                    office_code: office_code,
                    date: `2022-${month}-${String(day).padStart(2, '0')}T00:00:00.000Z`,
                    year: 2022,
                }

                holidayList.push(data);
            }
        }
    }
}

console.log(JSON.stringify(holidayList));
