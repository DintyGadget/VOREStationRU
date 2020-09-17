import { toTitleCase } from 'common/string';
import { Fragment } from 'inferno';
import { useBackend, useLocalState } from "../backend";
import { Box, Button, Collapsible, Dropdown, Flex, Input, NoticeBox, Section, LabeledList, AnimatedNumber, NumberInput } from '../components';
import { Window } from "../layouts";
import { sortBy } from 'common/collections';

export const MiningStackingConsole = (props, context) => {
  const { act, data } = useBackend(context);

  const {
    stacktypes,
    stackingAmt,
  } = data;

  return (
    <Window width={400} height={500} resizable>
      <Window.Content>
        <Section title="Управление Укладчиком">
          <LabeledList>
            <LabeledList.Item label="Укладка">
              <NumberInput
                fluid
                value={stackingAmt}
                minValue={1}
                maxValue={50}
                stepPixelSize={5}
                onChange={(e, val) => act("change_stack", { amt: val })} />
            </LabeledList.Item>
            <LabeledList.Divider />
            {stacktypes.length && stacktypes.sort().map(stack => (
              <LabeledList.Item key={stack.type} label={toTitleCase(stack.type)} buttons={
                <Button
                  icon="eject"
                  onClick={() => act("release_stack", { stack: stack.type })}>
                  Извлечь
                </Button>
              }>
                <AnimatedNumber value={stack.amt} />
              </LabeledList.Item>
            )) || (
              <LabeledList.Item label="Пространство" color="average">
                Стаков в машине нет.
              </LabeledList.Item>
            )}
          </LabeledList>
        </Section>
      </Window.Content>
    </Window>
  );
};
