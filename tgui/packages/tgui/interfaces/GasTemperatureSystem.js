import { round } from 'common/math';
import { Fragment } from 'inferno';
import { useBackend } from "../backend";
import { Box, Button, Flex, Icon, LabeledList, ProgressBar, Section, Knob, Slider, LabeledControls, AnimatedNumber } from "../components";
import { Window } from "../layouts";

export const GasTemperatureSystem = (props, context) => {
  const { act, data } = useBackend(context);

  const {
    on,
    gasPressure,
    gasTemperature,
    minGasTemperature,
    maxGasTemperature,
    targetGasTemperature,
    gasTemperatureClass,
    powerSetting,
  } = data;

  return (
    <Window
      width={270}
      height={270}
      resizeable>
      <Window.Content>
        <Section title="Управление" buttons={
          <Button
            icon="power-off"
            content={on ? "Вкл" : "Выкл"}
            selected={on}
            onClick={() => act("toggleStatus")} />
        }>
          <LabeledControls>
            <LabeledControls.Item label="Уровень мощности">
              <Knob
                minValue="0"
                maxValue="100"
                stepPixelSize="1"
                value={powerSetting}
                onChange={(e, val) => act("setPower", { value: val })}
              />
            </LabeledControls.Item>
            <LabeledControls.Item label="Давление газа">
              {gasPressure} kPa
            </LabeledControls.Item>
          </LabeledControls>
        </Section>
        <Section title="Температура газа">
          <LabeledList>
            <LabeledList.Item label="Текущая температура">
              <AnimatedNumber value={gasTemperature} /> K
            </LabeledList.Item>
            <LabeledList.Item label="Целевая температура">
              <AnimatedNumber value={targetGasTemperature} /> K
            </LabeledList.Item>
          </LabeledList>
          <Slider
            mt="0.4em"
            animated
            minValue={minGasTemperature}
            maxValue={maxGasTemperature}
            fillValue={gasTemperature}
            value={targetGasTemperature}
            format={value => (gasTemperature + " / " + round(value))}
            unit="K"
            color={gasTemperatureClass}
            onChange={(e, val) => act("setGasTemperature", { temp: val })} />
        </Section>
      </Window.Content>
    </Window>
  );
};

/* <LabeledList>
  <LabeledList.Item label="Current">
    <ProgressBar
      min={minGasTemperature}
      max={maxGasTemperature}
      value={gasTemperature} />
  </LabeledList.Item>
</LabeledList> */