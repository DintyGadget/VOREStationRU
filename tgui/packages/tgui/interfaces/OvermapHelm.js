import { round } from 'common/math';
import { Fragment } from 'inferno';
import { useBackend, useLocalState } from "../backend";
import { Box, Button, Flex, Icon, LabeledList, ProgressBar, Section, Table } from "../components";
import { Window } from "../layouts";
import { OvermapFlightData, OvermapPanControls } from './common/Overmap';

export const OvermapHelm = (props, context) => {
  const { act, data } = useBackend(context);
  return (
    <Window width={565} height={545} resizable>
      <Window.Content>
        <Flex>
          <Flex.Item basis="40%" height="180px">
            <OvermapFlightDataWrap />
          </Flex.Item>
          <Flex.Item basis="25%" height="180px">
            <OvermapManualControl />
          </Flex.Item>
          <Flex.Item basis="35%" height="180px">
            <OvermapAutopilot />
          </Flex.Item>
        </Flex>
        <OvermapNavComputer />
      </Window.Content>
    </Window>
  );
};

export const OvermapFlightDataWrap = (props, context) => {
  const { act, data } = useBackend(context);

  // While, yes, this is a strange choice to use fieldset over Section
  // just look at how pretty the legend is, sticking partially through the border ;///;
  return (
    <fieldset style={{ height: "100%", border: "1px solid #4972a1", margin: 'none' }} className="Section">
      <legend>Flight Data</legend>
      <OvermapFlightData />
    </fieldset>
  );
};

const OvermapManualControl = (props, context) => {
  const { act, data } = useBackend(context);

  const {
    canburn,
    manual_control,
  } = data;

  return (
    <fieldset style={{ height: "100%", border: "1px solid #4972a1" }} className="Section">
      <legend>Manual Control</legend>
      <Flex align="center" justify="center">
        <Flex.Item>
          <OvermapPanControls disabled={!canburn} actToDo="move" />
        </Flex.Item>
      </Flex>
      <Box textAlign="center" mt={1}>
        <Box bold underline>
          Ручное управление
        </Box>
        <Button
          selected={manual_control}
          onClick={() => act("manual")}
          icon="compass">
          {manual_control ? "Вкл" : "Выкл"}
        </Button>
      </Box>
    </fieldset>
  );
};

const OvermapAutopilot = (props, context) => {
  const { act, data } = useBackend(context);
  const {
    dest,
    d_x,
    d_y,
    speedlimit,
    autopilot,
    autopilot_disabled,
  } = data;

  if (autopilot_disabled) {
    return (
      <fieldset style={{ height: "100%", border: "1px solid #4972a1" }} className="Section">
        <legend>Autopilot</legend>
        <Box textAlign="center" color="bad" fontSize={1.2}>
          АВТОПИЛОТ ОТКЛЮЧЕН
        </Box>
        <Box textAlign="center" color="average">
          Предупреждение: это судно оборудовано автопилотом класса I.
          Автопилоты класса I не могут ничего делать, кроме как
          лететь по прямой прямо к цели, что может привести к 
          столкновениям.
        </Box>
        <Box textAlign="center">
          <Button.Confirm
            mt={1}
            color="bad"
            content="Разблок. автопилот"
            confirmContent="ПРИНЯТЬ РИСКИ?"
            icon="exclamation-triangle"
            confirmIcon="exclamation-triangle"
            onClick={() => act("apilot_lock")} />
        </Box>
      </fieldset>
    );
  }

  return (
    <fieldset style={{ height: "100%", border: "1px solid #4972a1" }} className="Section">
      <legend>Автопилот</legend>
      <LabeledList>
        <LabeledList.Item label="Цель">
          {dest && (
            <Fragment>
              <Button onClick={() => act("setcoord", { setx: true })}>
                {d_x}
              </Button>
              <Button onClick={() => act("setcoord", { sety: true })}>
                {d_y}
              </Button>
            </Fragment>
          ) || (
            <Button icon="pen" onClick={() => act("setcoord", { setx: true, sety: true })}>
              Нет
            </Button>
          )}
        </LabeledList.Item>
        <LabeledList.Item label="Огран. скорости">
          <Button
            icon="tachometer-alt"
            onClick={() => act("speedlimit")}>
            {speedlimit} Gm/h
          </Button>
        </LabeledList.Item>
      </LabeledList>
      <Button
        mt={1}
        fluid
        selected={autopilot}
        disabled={!dest}
        icon="robot"
        onClick={() => act("apilot")}>
        {autopilot ? "Включен" : "Выключен"}
      </Button>
      <Button
        fluid
        color="good"
        icon="exclamation-triangle"
        onClick={() => act("apilot_lock")}>
        Блокировка автопилота
      </Button>
    </fieldset>
  );
};

const OvermapNavComputer = (props, context) => {
  const { act, data } = useBackend(context);

  const {
    sector,
    s_x,
    s_y,
    sector_info,
    landed,
    locations,
  } = data;

  return (
    <Section title="Данные навигации" m={0.3} mt={1}>
      <LabeledList>
        <LabeledList.Item label="Текущее положение">
          {sector}
        </LabeledList.Item>
        <LabeledList.Item label="Координаты">
          {s_x} : {s_y}
        </LabeledList.Item>
        <LabeledList.Item label="Данные сканирования">
          {sector_info}
        </LabeledList.Item>
        <LabeledList.Item label="Состояние">
          {landed}
        </LabeledList.Item>
      </LabeledList>
      <Flex mt={1} align="center" justify="center" spacing={1}>
        <Flex.Item basis="50%">
          <Button
            fluid
            icon="save"
            onClick={() => act("add", { add: "current" })}>
            Сохранить текущую позицию
          </Button>
        </Flex.Item>
        <Flex.Item basis="50%">
          <Button
            fluid
            icon="sticky-note"
            onClick={() => act("add", { add: "new" })}>
            Добавить новую запись
          </Button>
        </Flex.Item>
      </Flex>
      <Section mt={1} scrollable height="130px">
        <Table>
          <Table.Row header>
            <Table.Cell>Название</Table.Cell>
            <Table.Cell>Координаты</Table.Cell>
            <Table.Cell>Действия</Table.Cell>
          </Table.Row>
          {locations.map(loc => (
            <Table.Row key={loc.name}>
              <Table.Cell>{loc.name}</Table.Cell>
              <Table.Cell>{loc.x} : {loc.y}</Table.Cell>
              <Table.Cell collapsing>
                <Button
                  icon="rocket"
                  onClick={() => act("setds", { x: loc.x, y: loc.y })}>
                  Задать курс
                </Button>
                <Button
                  icon="trash"
                  onClick={() => act("remove", { remove: loc.reference })}>
                  Удалить
                </Button>
              </Table.Cell>
            </Table.Row>
          ))}
        </Table>
      </Section>
    </Section>
  );
};