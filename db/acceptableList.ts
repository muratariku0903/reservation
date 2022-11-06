type Acceptable = { office_code: number, date: string, start: number, end: number, register_cnt: number, max_register_cnt: number };
const acceptableList: Acceptable[] = [];
for (let office_code = 3; office_code <= 3; office_code++) {
    let first_holiday = 0;
    let second_holiday = 1;
    if (office_code === 1) {

    } else if (office_code === 2) {
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
            const category = week === first_holiday || week === second_holiday ? [9, 12] : [9, 12, 15, 17];
            let start = 0;
            let end = 0;

            for (const time of category) {
                start = time;
                end = time + 3;

                const register_cnt = Math.floor(Math.random() * 3);

                const data: Acceptable = {
                    office_code: office_code,
                    date: `2023-${month}-${String(day).padStart(2, '0')}T00:00:00.000Z`,
                    start: start,
                    end: end,
                    register_cnt: register_cnt,
                    max_register_cnt: register_cnt + Math.floor(Math.random() * 5)
                }

                acceptableList.push(data);
            }


        }
    }
}

console.log(JSON.stringify(acceptableList));
