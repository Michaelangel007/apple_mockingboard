all: test_mock scales freq

clean:
	rm freq 0freq 1freq

.PHONY: test_mock

C_FLAGS=-Wall -Wextra

test_mock:
	src2dsk         test_mock.s
	applewin.sh -d1 test_mock.dsk

scales: scales.s
	src2dsk                    $<
	applewin.sh -d1 $(basename $<).dsk

freq: freq.c
	g++ $(C_FLAGS) $< -o $@
	cp freq 0freq
	cp freq 1freq

