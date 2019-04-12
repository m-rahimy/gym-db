CREATE TABLE `athlete` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `weight` double NOT NULL,
  `height` double NOT NULL,
  `wristSize` double NOT NULL,
  `armSize` double NOT NULL,
  `tightSize` double NOT NULL,
  `chestSize` double NOT NULL,
  `abdomenSize` double NOT NULL,
  `birthDate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `inserted_practice` (
  `id` int(11) NOT NULL,
  `athleteID` int(11) NOT NULL,
  `programJoinMoveID` int(11) NOT NULL,
  `practiceID` int(11) NOT NULL,
  `workout_id` int(11) NOT NULL,
  `insertedDate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `move` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `picture_id` text COLLATE utf8_unicode_ci NOT NULL,
  `withDumbbell` int(11) NOT NULL,
  `withBarbel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `move`
--

INSERT INTO `move` (`id`, `name`, `description`, `picture_id`, `withDumbbell`, `withBarbel`) VALUES
(1, 'Squat', 'Squat', 'move_squat', 0, 0),
(2, 'Leg press', 'Leg press', 'move_leg_press', 0, 0),
(3, 'Lunge', 'Lunge', 'move_lunge', 0, 0),
(4, 'Deadlift', 'Deadlift', 'move_deadlift', 0, 0),
(5, 'Leg extension', 'Leg extension', 'move_', 0, 0),
(6, 'Leg curl', 'Leg curl', 'move_', 0, 0),
(7, 'Standing calf raise', 'Standing calf raise', 'move_', 0, 0),
(8, 'Seated calf raise', 'Seated calf raise', 'move_', 0, 0),
(9, 'Hip adductor', 'Hip adductor', 'move_', 0, 0),
(10, 'Bench press', 'Bench press', 'move_', 0, 0),
(11, 'Chest fly', 'Chest fly', 'move_', 0, 0),
(12, 'Push-up', 'Push-up', 'move_', 0, 0),
(13, 'Pulldown', 'Pulldown', 'move_', 0, 0),
(14, 'Pull-up', 'Pull-up', 'move_', 0, 0),
(15, 'Bent-over row', 'Bent-over row', 'move_', 0, 0),
(16, 'Upright row', 'Upright row', 'move_', 0, 0),
(17, 'Shoulder press', 'Shoulder press', 'move_', 0, 0),
(18, 'Shoulder fly', 'Shoulder fly', 'move_', 0, 0),
(19, 'Lateral raise', 'Lateral raise', 'move_', 0, 0),
(20, 'Shoulder shrug', 'Shoulder shrug', 'move_', 0, 0),
(21, 'Pushdown', 'Pushdown', 'move_', 0, 0),
(22, 'Triceps extension', 'Triceps extension', 'move_', 0, 0),
(23, 'Biceps curl', 'Biceps curl', 'move_', 0, 0),
(24, 'Crunch', 'Crunch', 'move_', 0, 0),
(25, 'Russian twist', 'Russian twist', 'move_', 0, 0),
(26, 'Leg raise', 'Leg raise', 'move_', 0, 0),
(27, 'Back extension', 'Back extension', 'move_', 0, 0),
(28, 'Upper Bench press', 'Upper Bench press', 'move_', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `practice`
--

CREATE TABLE `practice` (
  `id` int(11) NOT NULL,
  `athleteID` int(11) NOT NULL,
  `programJoinMoveID` int(11) NOT NULL,
  `workoutID` int(11) NOT NULL,
  `undone` int(11) NOT NULL,
  `setNumber` int(11) NOT NULL,
  `weight` double NOT NULL,
  `aroundMuscleReleased` double NOT NULL,
  `aroundMuscleFlexed` double NOT NULL,
  `startedDoingDate` int(11) NOT NULL,
  `endedDoingDate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `program` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `created` int(11) NOT NULL,
  `updated` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `program_join_move` (
  `id` int(11) NOT NULL,
  `moveID` int(11) NOT NULL,
  `programID` int(11) NOT NULL,
  `index` int(11) NOT NULL,
  `sets` text COLLATE utf8_unicode_ci NOT NULL,
  `assignedDate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `weight` (
  `id` int(11) NOT NULL,
  `size` double NOT NULL,
  `isDumbbell` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `workout` (
  `id` int(11) NOT NULL,
  `athleteID` int(11) NOT NULL,
  `weightBefore` double NOT NULL,
  `weightAfter` double NOT NULL,
  `usedAnySupplements` int(11) NOT NULL,
  `gymName` text COLLATE utf8_unicode_ci NOT NULL,
  `startedDoingDate` int(11) NOT NULL,
  `endDoingDate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `athlete`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `inserted_practice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `athleteID` (`athleteID`),
  ADD KEY `programJoinMoveID` (`programJoinMoveID`),
  ADD KEY `practiceID` (`practiceID`),
  ADD KEY `workout_id` (`workout_id`);

ALTER TABLE `move`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `practice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `athleteID` (`athleteID`),
  ADD KEY `programJoinMoveID` (`programJoinMoveID`),
  ADD KEY `workoutID` (`workoutID`);

ALTER TABLE `program`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `program_join_move`
  ADD PRIMARY KEY (`id`),
  ADD KEY `moveID` (`moveID`),
  ADD KEY `programID` (`programID`);

ALTER TABLE `weight`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `workout`
  ADD PRIMARY KEY (`id`),
  ADD KEY `athleteID` (`athleteID`);

ALTER TABLE `athlete`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `inserted_practice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

ALTER TABLE `move`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

ALTER TABLE `practice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

ALTER TABLE `program`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `program_join_move`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

ALTER TABLE `weight`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

ALTER TABLE `workout`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `inserted_practice`
  ADD CONSTRAINT `inserted_practice_ibfk_1` FOREIGN KEY (`workout_id`) REFERENCES `workout` (`id`),
  ADD CONSTRAINT `inserted_practice_ibfk_2` FOREIGN KEY (`athleteID`) REFERENCES `athlete` (`id`),
  ADD CONSTRAINT `inserted_practice_ibfk_3` FOREIGN KEY (`programJoinMoveID`) REFERENCES `program_join_move` (`id`),
  ADD CONSTRAINT `inserted_practice_ibfk_4` FOREIGN KEY (`practiceID`) REFERENCES `practice` (`id`);

ALTER TABLE `practice`
  ADD CONSTRAINT `practice_ibfk_1` FOREIGN KEY (`athleteID`) REFERENCES `athlete` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `practice_ibfk_2` FOREIGN KEY (`programJoinMoveID`) REFERENCES `program_join_move` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `practice_ibfk_3` FOREIGN KEY (`workoutID`) REFERENCES `workout` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `program_join_move`
  ADD CONSTRAINT `program_join_move_ibfk_1` FOREIGN KEY (`moveID`) REFERENCES `move` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `program_join_move_ibfk_2` FOREIGN KEY (`programID`) REFERENCES `program` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `workout`
  ADD CONSTRAINT `workout_ibfk_1` FOREIGN KEY (`athleteID`) REFERENCES `athlete` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;
