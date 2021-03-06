-- 회원
DROP TABLE IF EXISTS P0_MEMB RESTRICT;

-- 공항정보
DROP TABLE IF EXISTS P0_AP RESTRICT;

-- 운항정보
DROP TABLE IF EXISTS P0_TRVL RESTRICT;

-- 예약
DROP TABLE IF EXISTS P0_RSV RESTRICT;

-- 좌석정보
DROP TABLE IF EXISTS P0_GRD RESTRICT;

-- 회원
CREATE TABLE P0_MEMB (
    MNO  INTEGER      NOT NULL COMMENT '회원번호', -- 회원번호
    MID  VARCHAR(40)  NOT NULL COMMENT '아이디', -- 아이디
    NAME VARCHAR(50)  NOT NULL COMMENT '이름', -- 이름
    PWD  VARCHAR(100) NOT NULL COMMENT '암호', -- 암호
    SDT  DATETIME     NOT NULL COMMENT '가입날짜', -- 가입날짜
    MDT  DATETIME     NOT NULL COMMENT '수정날짜' -- 수정날짜
)
COMMENT '회원';

-- 회원
ALTER TABLE P0_MEMB
    ADD CONSTRAINT PK_P0_MEMB -- 회원 기본키
        PRIMARY KEY (
            MNO -- 회원번호
        );

-- 회원 유니크 인덱스
CREATE UNIQUE INDEX UIX_P0_MEMB
    ON P0_MEMB ( -- 회원
        MID ASC -- 아이디
    );

ALTER TABLE P0_MEMB
    MODIFY COLUMN MNO INTEGER NOT NULL AUTO_INCREMENT COMMENT '회원번호';

-- 공항정보
CREATE TABLE P0_AP (
    ANO  INTEGER     NOT NULL COMMENT '공항번호', -- 공항번호
    NAME VARCHAR(50) NOT NULL COMMENT '이름', -- 이름
    SDT  DATETIME    NOT NULL COMMENT '입력날짜', -- 입력날짜
    MDT  DATETIME    NOT NULL COMMENT '수정날짜' -- 수정날짜
)
COMMENT '공항정보';

-- 공항정보
ALTER TABLE P0_AP
    ADD CONSTRAINT PK_P0_AP -- 공항정보 기본키
        PRIMARY KEY (
            ANO -- 공항번호
        );

ALTER TABLE P0_AP
    MODIFY COLUMN ANO INTEGER NOT NULL AUTO_INCREMENT COMMENT '공항번호';

-- 운항정보
CREATE TABLE P0_TRVL (
    TNO INTEGER  NOT NULL COMMENT '운항번호', -- 운항번호
    SAP INTEGER  NOT NULL COMMENT '출발지', -- 출발지
    AAP INTEGER  NOT NULL COMMENT '도착지', -- 도착지
    SDT DATETIME NOT NULL COMMENT '출발시간', -- 출발시간
    ADT DATETIME NOT NULL COMMENT '도착시간', -- 도착시간
    IDT DATETIME NOT NULL COMMENT '입력날짜', -- 입력날짜
    MDT DATETIME NOT NULL COMMENT '수정날짜' -- 수정날짜
)
COMMENT '운항정보';

-- 운항정보
ALTER TABLE P0_TRVL
    ADD CONSTRAINT PK_P0_TRVL -- 운항정보 기본키
        PRIMARY KEY (
            TNO -- 운항번호
        );

ALTER TABLE P0_TRVL
    MODIFY COLUMN TNO INTEGER NOT NULL AUTO_INCREMENT COMMENT '운항번호';

-- 예약
CREATE TABLE P0_RSV (
    RNO INTEGER NOT NULL COMMENT '예약번호', -- 예약번호
    MNO INTEGER NOT NULL COMMENT '회원번호', -- 회원번호
    TNO INTEGER NOT NULL COMMENT '운항번호' -- 운항번호
)
COMMENT '예약';

-- 예약
ALTER TABLE P0_RSV
    ADD CONSTRAINT PK_P0_RSV -- 예약 기본키
        PRIMARY KEY (
            RNO -- 예약번호
        );

-- 예약 유니크 인덱스
CREATE UNIQUE INDEX UIX_P0_RSV
    ON P0_RSV ( -- 예약
        MNO ASC, -- 회원번호
        TNO ASC  -- 운항번호
    );

ALTER TABLE P0_RSV
    MODIFY COLUMN RNO INTEGER NOT NULL AUTO_INCREMENT COMMENT '예약번호';

-- 좌석정보
CREATE TABLE P0_GRD (
    TNO INTEGER NOT NULL COMMENT '운항번호', -- 운항번호
    CLS INTEGER NOT NULL COMMENT '좌석등급', -- 좌석등급
    PRC INTEGER NOT NULL COMMENT '가격', -- 가격
    SNO INTEGER NOT NULL COMMENT '총좌석수' -- 총좌석수
)
COMMENT '좌석정보';

-- 좌석정보
ALTER TABLE P0_GRD
    ADD CONSTRAINT PK_P0_GRD -- 좌석정보 기본키
        PRIMARY KEY (
            TNO, -- 운항번호
            CLS  -- 좌석등급
        );

-- 좌석정보 유니크 인덱스
CREATE UNIQUE INDEX UIX_P0_GRD
    ON P0_GRD ( -- 좌석정보
    );

-- 운항정보
ALTER TABLE P0_TRVL
    ADD CONSTRAINT FK_P0_AP_TO_P0_TRVL2 -- 공항정보 -> 운항정보
        FOREIGN KEY (
            SAP -- 출발지
        )
        REFERENCES P0_AP ( -- 공항정보
            ANO -- 공항번호
        );

-- 운항정보
ALTER TABLE P0_TRVL
    ADD CONSTRAINT FK_P0_AP_TO_P0_TRVL -- 공항정보 -> 운항정보2
        FOREIGN KEY (
            AAP -- 도착지
        )
        REFERENCES P0_AP ( -- 공항정보
            ANO -- 공항번호
        );

-- 예약
ALTER TABLE P0_RSV
    ADD CONSTRAINT FK_P0_MEMB_TO_P0_RSV -- 회원 -> 예약
        FOREIGN KEY (
            MNO -- 회원번호
        )
        REFERENCES P0_MEMB ( -- 회원
            MNO -- 회원번호
        );

-- 예약
ALTER TABLE P0_RSV
    ADD CONSTRAINT FK_P0_TRVL_TO_P0_RSV -- 운항정보 -> 예약
        FOREIGN KEY (
            TNO -- 운항번호
        )
        REFERENCES P0_TRVL ( -- 운항정보
            TNO -- 운항번호
        );

-- 좌석정보
ALTER TABLE P0_GRD
    ADD CONSTRAINT FK_P0_TRVL_TO_P0_GRD -- 운항정보 -> 좌석정보
        FOREIGN KEY (
            TNO -- 운항번호
        )
        REFERENCES P0_TRVL ( -- 운항정보
            TNO -- 운항번호
        );