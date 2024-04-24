USE dev51db;

-- 0. CREATE TABLE
-- Member
DROP TABLE IF EXISTS `tb02_member`;
CREATE TABLE `tb02_member`
(
    `m_id`    varchar(50) NOT NULL,
    `m_pw`    varchar(50) NOT NULL,
    `m_level` varchar(50) NOT NULL DEFAULT '0',
    `m_name`  varchar(50) NOT NULL,
    `m_email` varchar(50) NOT NULL,
    `m_phone` varchar(50) NOT NULL DEFAULT '0',
    `m_addr`  varchar(50) NOT NULL DEFAULT '0',
    PRIMARY KEY (`m_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb3;

-- Sample insert
INSERT INTO `tb02_member` (`m_id`, `m_pw`, `m_level`, `m_name`, `m_email`, `m_phone`, `m_addr`)
VALUES ('id001', 'pw001', '관리자', '홍길동', 'hongbronze@naver.com', '010-1234-5678', '금암동'),
       ('id002', 'pw002', '일반회원', '홍길은', 'hongsilver@naver.com', '010-2345-6789', '금암동'),
       ('id003', 'pw003', '일반회원', '홍길은', 'hongsilver@naver.com', '010-2345-6789', '금암동');


-- Bulletin
DROP TABLE IF EXISTS `tb02_bulletin`;
CREATE TABLE `tb02_bulletin`
(
    `b_code`   varchar(50)  NOT NULL,
    `m_id`     varchar(50)  NOT NULL,
    `b_date`   date         NOT NULL,
    `b_title`  varchar(50)  NOT NULL DEFAULT '',
    `b_body`   varchar(200) NOT NULL DEFAULT '',
    `b_amount` int          NOT NULL DEFAULT (0),
    `b_addr`   varchar(50)  NOT NULL DEFAULT '0',
    PRIMARY KEY (`b_code`),
    FOREIGN KEY (m_id) REFERENCES tb02_member (m_id)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb3;

-- Sample insert
INSERT INTO `tb02_bulletin` (`b_code`, `m_id`, `b_date`, `b_title`, `b_body`, `b_amount`, `b_addr`)
VALUES ('bc001', 'id001', '2024-04-23', '제목1', 'body1', 1, '금암동'),
       ('bc002', 'id002', '2024-04-22', '제목2', 'body2', 2, '금암동'),
       ('bc003', 'id003', '2024-04-01', '제목3', 'body3', 3, '금암동');


-- Party
DROP TABLE IF EXISTS `tb02_party`;
CREATE TABLE `tb02_party`
(
    `b_code`   varchar(50) NOT NULL,
    `m_id`     varchar(50) NOT NULL,
    `p_amount` int         NOT NULL DEFAULT (0),
    `p_result` varchar(50) NOT NULL DEFAULT '0',
    PRIMARY KEY (`b_code`, `m_id`),
    FOREIGN KEY (b_code) REFERENCES tb02_bulletin (b_code),
    FOREIGN KEY (m_id) REFERENCES tb02_member (m_id)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb3;

-- Sample insert
INSERT INTO `tb02_party` (`b_code`, `m_id`, `p_amount`, `p_result`)
VALUES ('bc001', 'id001', 50, '완료'),
       ('bc001', 'id002', 30, '완료'),
       ('bc001', 'id003', 20, '완료'),
       ('bc002', 'id001', 100, '진행중'),
       ('bc002', 'id003', 50, '진행중'),
       ('bc003', 'id002', 50, '진행중');
