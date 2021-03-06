import { round } from 'common/math';
import { Fragment } from 'inferno';
import { useBackend } from "../backend";
import { Box, Button, Flex, Icon, LabeledList, ProgressBar, Section, Knob, Slider, LabeledControls, AnimatedNumber } from "../components";
import { Window } from "../layouts";

export const PressureRegulator = (props, context) => {
  const { act, data } = useBackend(context);

  const {
    on,
    pressure_set,
    max_pressure,
    input_pressure,
    output_pressure,
    regulate_mode,
    set_flow_rate,
    last_flow_rate,
  } = data;

  return (
    <Window
      width={470}
      height={370}
      resizable>
      <Window.Content>
        <Section title="Состояние">
          <LabeledList>
            <LabeledList.Item label="Вход. давление">
              <AnimatedNumber value={input_pressure / 100} /> kPa
            </LabeledList.Item>
            <LabeledList.Item label="Выход. давление">
              <AnimatedNumber value={output_pressure / 100} /> kPa
            </LabeledList.Item>
            <LabeledList.Item label="Flow Rate">
              <AnimatedNumber value={last_flow_rate / 10} /> L/s
            </LabeledList.Item>
          </LabeledList>
        </Section>
        <Section
          title="Управление"
          buttons={
            <Button
              icon="power-off"
              content={on ? "Открыть" : "Закрыть"}
              selected={on}
              onClick={() => act("toggle_valve")} />
          }>
          <LabeledList>
            <LabeledList.Item
              label="Регулирование давления"
              buttons={
                <Fragment>
                  <Button
                    icon="power-off"
                    content="Выкл"
                    selected={regulate_mode === 0}
                    onClick={() => act("regulate_mode", { mode: "off" })} />
                  <Button
                    icon="compress-arrows-alt"
                    content="Ввод"
                    selected={regulate_mode === 1}
                    onClick={() => act("regulate_mode", { mode: "input" })} />
                  <Button
                    icon="expand-arrows-alt"
                    content="Вывод"
                    selected={regulate_mode === 2}
                    onClick={() => act("regulate_mode", { mode: "output" })} />
                </Fragment>
              } />
            <LabeledList.Item
              label="Желаемое выходное давление"
              buttons={
                <Fragment>
                  <Button
                    icon="compress-arrows-alt"
                    content="Мин"
                    onClick={() => act("set_press", { press: "min" })} />
                  <Button
                    icon="expand-arrows-alt"
                    content="Макс"
                    onClick={() => act("set_press", { press: "max" })} />
                  <Button
                    icon="wrench"
                    content="Уст"
                    onClick={() => act("set_press", { press: "set" })} />
                </Fragment>
              }>
              {pressure_set / 100} kPa
            </LabeledList.Item>
            <LabeledList.Item
              label="Огранич. Скорости Потока "
              buttons={
                <Fragment>
                  <Button
                    icon="compress-arrows-alt"
                    content="Мин"
                    onClick={() => act("set_flow_rate", { press: "min" })} />
                  <Button
                    icon="expand-arrows-alt"
                    content="Макс"
                    onClick={() => act("set_flow_rate", { press: "max" })} />
                  <Button
                    icon="wrench"
                    content="Уст"
                    onClick={() => act("set_flow_rate", { press: "set" })} />
                </Fragment>
              }>
              {set_flow_rate / 10} L/s
            </LabeledList.Item>
          </LabeledList>
        </Section>
      </Window.Content>
    </Window>
  );
};