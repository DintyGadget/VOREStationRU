import { toTitleCase } from 'common/string';
import { Fragment } from 'inferno';
import { useBackend, useLocalState } from "../backend";
import { Box, Button, Collapsible, Dropdown, Flex, Input, NoticeBox, Section, LabeledList, AnimatedNumber } from '../components';
import { Window } from "../layouts";
import { refocusLayout } from '../layouts';
import { sortBy } from 'common/collections';
import { MiningUser } from './common/Mining';

export const MiningOreProcessingConsole = (props, context) => {
  const { act, data } = useBackend(context);

  const {
    unclaimedPoints,
    ores,
    showAllOres,
    power,
  } = data;

  return (
    <Window width={400} height={500} resizable>
      <Window.Content>
        <MiningUser insertIdText={(
          <Box>
            <Button
              icon="arrow-right"
              mr={1}
              onClick={() => act("insert")}>
              Вставьте ID
            </Button>
            для того чтобы претендовать на очки.
          </Box>
        )} />
        <Section title="Состояние" buttons={
          <Button
            icon="power-off"
            selected={power}
            onClick={() => act("power")}>
            {power ? "Плавка" : "Ничего"}
          </Button>
        }>
          <LabeledList>
            <LabeledList.Item label="Текущие невостреб. баллы" buttons={
              <Button
                disabled={unclaimedPoints < 1}
                icon="download"
                onClick={() => act("claim")}>
                Получить
              </Button>
            }>
              <AnimatedNumber value={unclaimedPoints} />
            </LabeledList.Item>
          </LabeledList>
        </Section>
        <MOPCOres />
      </Window.Content>
    </Window>
  );
};

// ORDER IS IMPORTANT HERE.
const processingOptions = [
  "Не обрабатывая",
  "Плавление",
  "Компрессия",
  "Сплавление",
];

// Higher in the list == closer to top
// This is just kind of an arbitrary list to sort by because the machine has no predictable ore order in it's list
// and alphabetizing them doesn't really make sense
const oreOrder = [
  "verdantium",
  "mhydrogen",
  "diamond",
  "platinum",
  "uranium",
  "gold",
  "silver",
  "rutile",
  "phoron",
  "marble",
  "lead",
  "sand",
  "carbon",
  "hematite",
];

const oreSorter = (a, b) => {
  if (oreOrder.indexOf(a.ore) === -1) {
    return a.ore - b.ore;
  }
  if (oreOrder.indexOf(b.ore) === -1) {
    return a.ore - b.ore;
  }
  return oreOrder.indexOf(b.ore) - oreOrder.indexOf(a.ore);
};

const MOPCOres = (props, context) => {
  const { act, data } = useBackend(context);
  const {
    ores,
    showAllOres,
    power,
  } = data;
  return (
    <Section title="Управление переработкой руды" buttons={
      <Button
        icon={showAllOres ? "toggle-on" : "toggle-off"}
        selected={showAllOres}
        onClick={() => act("showAllOres")}>
        {showAllOres ? "Все руды" : "Руды в машине"}
      </Button>
    }>
      <LabeledList>
        {ores.length && ores.sort(oreSorter).map(ore => (
          <LabeledList.Item key={ore.ore} label={toTitleCase(ore.name)} buttons={
            <Dropdown
              width="120px"
              color={
                ore.processing === 0 && 'red'
                || ore.processing === 1 && 'green'
                || ore.processing === 2 && 'blue'
                || ore.processing === 3 && 'yellow'
              }
              options={processingOptions}
              selected={processingOptions[ore.processing]}
              onSelected={val => act("toggleSmelting", {
                ore: ore.ore,
                set: processingOptions.indexOf(val),
              })} />
          }>
            <Box inline>
              <AnimatedNumber value={ore.amount} />
            </Box>
          </LabeledList.Item>
        )) || (
          <Box color="bad" textAlign="center">
            Руд в машине нет.
          </Box>
        )}
      </LabeledList>
    </Section>
  );
};