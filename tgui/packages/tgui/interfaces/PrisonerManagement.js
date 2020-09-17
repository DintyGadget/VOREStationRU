import { round } from 'common/math';
import { Fragment } from 'inferno';
import { useBackend } from '../backend';
import { Button, Section, NumberInput, Flex, Box, Table } from '../components';
import { Window } from '../layouts';
import { formatTime } from '../format';

export const PrisonerManagement = (props, context) => {
  const { act, data } = useBackend(context);
  const {
    locked,
    chemImplants,
    trackImplants,
  } = data;
  return (
    <Window width={500} height={400} resizable>
      <Window.Content scrollable>
        {locked && (
          <Section title="Блокировка" textAlign="center">
            Этот интерфейс в настоящее время заблокирован.
            <Box>
              <Button
                icon="unlock"
                onClick={() => act("lock")}>
                Открыть
              </Button>
            </Box>
          </Section>
        ) || (
          <Fragment>
            <Section title="Блокировка" buttons={
              <Button
                icon="lock"
                onClick={() => act("lock")}>
                Заблокировать
              </Button>
            } />
            <Section title="Химические имплантаты">
              {chemImplants.length && (
                <Table>
                  <Table.Row header>
                    <Table.Cell textAlign="center">Хозяин</Table.Cell>
                    <Table.Cell textAlign="center">Осталось единиц</Table.Cell>
                    <Table.Cell textAlign="center">Ввести</Table.Cell>
                  </Table.Row>
                  {chemImplants.map(chem => (
                    <Table.Row key={chem.ref}>
                      <Table.Cell textAlign="center">
                        {chem.host}
                      </Table.Cell>
                      <Table.Cell textAlign="center">
                        {chem.units}u remaining
                      </Table.Cell>
                      <Table.Cell textAlign="center">
                        <Button onClick={() => act("inject", { imp: chem.ref, val: 1 })}>(1)</Button>
                        <Button onClick={() => act("inject", { imp: chem.ref, val: 5 })}>(5)</Button>
                        <Button onClick={() => act("inject", { imp: chem.ref, val: 10 })}>(10)</Button>
                      </Table.Cell>
                    </Table.Row>
                  ))}
                </Table>
              ) || (
                <Box color="average">
                  Химические имплантаты не обнаружены.
                </Box>
              )}
            </Section>
            <Section title="Отслеживаемые имплантаты">
              {trackImplants.length && (
                <Table>
                  <Table.Row header>
                    <Table.Cell textAlign="center">Хозяин</Table.Cell>
                    <Table.Cell textAlign="center">Положение</Table.Cell>
                    <Table.Cell textAlign="center">Сообщение</Table.Cell>
                  </Table.Row>
                  {trackImplants.map(track => (
                    <Table.Row key={track.ref}>
                      <Table.Cell textAlign="center">
                        {track.host} ({track.id})
                      </Table.Cell>
                      <Table.Cell textAlign="center">
                        {track.loc}
                      </Table.Cell>
                      <Table.Cell textAlign="center">
                        <Button onClick={() => act("warn", { imp: track.ref })}>Сообщение</Button>
                      </Table.Cell>
                    </Table.Row>
                  ))}
                </Table>
              ) || (
                <Box color="average">
                  Химические имплантаты не обнаружены.
                </Box>
              )}
            </Section>
          </Fragment>
        )}
      </Window.Content>
    </Window>
  );
};