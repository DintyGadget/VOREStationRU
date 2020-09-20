import { round } from 'common/math';
import { Fragment } from 'inferno';
import { useBackend } from "../backend";
import { Box, Button, Flex, Icon, LabeledList, ProgressBar, Section } from "../components";
import { Window } from "../layouts";

export const OvermapShipSensors = (props, context) => {
  const { act, data } = useBackend(context);
  const {
    viewing,
    on,
    range,
    health,
    max_health,
    heat,
    critical_heat,
    status,
    contacts,
  } = data;

  return (
    <Window width={375} height={545} resizable>
      <Window.Content>
        <Section title="���������" buttons={(
          <Fragment>
            <Button
              icon="eye"
              selected={viewing}
              onClick={() => act("viewing")}>
              �������� �����
            </Button>
            <Button
              icon="power-off"
              selected={on}
              onClick={() => act("toggle")}>
              {on ? "������� ���" : "������� ����"}
            </Button>
          </Fragment>
        )}>
          <LabeledList>
            <LabeledList.Item label="���������">
              {status}
            </LabeledList.Item>
            <LabeledList.Item label="��������">
              <Button
                icon="signal"
                onClick={() => act("range")}>
                {range}
              </Button>
            </LabeledList.Item>
            <LabeledList.Item label="�����������">
              <ProgressBar
                ranges={{
                  good: [max_health * 0.75, Infinity],
                  average: [max_health * 0.25, max_health * 0.75],
                  bad: [-Infinity, max_health * 0.25],
                }}
                value={health}
                maxValue={max_health}>
                {health} / {max_health}
              </ProgressBar>
            </LabeledList.Item>
            <LabeledList.Item label="�����������">
              <ProgressBar
                ranges={{
                  bad: [critical_heat * 0.75, Infinity],
                  average: [critical_heat * 0.5, critical_heat * 0.75],
                  good: [-Infinity, critical_heat * 0.5],
                }}
                value={heat}
                maxValue={critical_heat}>
                {heat < critical_heat * 0.5 && (
                  <Box>����������� ������.</Box>
                ) || heat < critical_heat * 0.75 && (
                  <Box>����������� �������� �������!</Box>
                ) || (
                  <Box>����������� �����������: ���������� ��������� ��������!</Box>
                )}
              </ProgressBar>
            </LabeledList.Item>
          </LabeledList>
        </Section>
        <Section title="�����">
          {contacts.length && contacts.map(alien => (
            <Button
              key={alien.ref}
              fluid
              icon="search"
              onClick={() => act("scan", { scan: alien.ref })}>
              <Box bold inline>����: {alien.name}</Box>
              <Box inline>, bearing: {alien.bearing}&deg;</Box>
            </Button>
          )) || (
            <Box color="average">
              No contacts on sensors.
            </Box>
          )}
        </Section>
        {data.status === "MISSING" && (
          <Section title="������">
            <Button
              icon="wifi"
              onClick={() => act("link")}>
              ������������ � ��������� ��������?
            </Button>
          </Section>
        ) || null}
      </Window.Content>
    </Window>
  );
};