import { Fragment } from 'inferno';
import { useBackend } from '../backend';
import { Button, LabeledList, Section } from '../components';
import { Window } from '../layouts';

const dangerMap = {
  2: {
    color: 'good',
    localStatusText: 'Оптимально',
  },
  1: {
    color: 'average',
    localStatusText: 'Осторожно!',
  },
  0: {
    color: 'bad',
    localStatusText: 'Выкл',
  },
};

export const AiAirlock = (props, context) => {
  const { act, data } = useBackend(context);
  const statusMain = dangerMap[data.power.main] || dangerMap[0];
  const statusBackup = dangerMap[data.power.backup] || dangerMap[0];
  const statusElectrify = dangerMap[data.shock] || dangerMap[0];
  return (
    <Window
      width={500}
      height={390}>
      <Window.Content>
        <Section title="Состояние сети">
          <LabeledList>
            <LabeledList.Item
              label="Main"
              color={statusMain.color}
              buttons={(
                <Button
                  icon="lightbulb-o"
                  disabled={!data.power.main}
                  content="Disrupt"
                  onClick={() => act('disrupt-main')} />
              )}>
              {data.power.main ? 'Online' : 'Offline'}
              {' '}
              {(!data.wires.main_1 || !data.wires.main_2)
                && '[Wires have been cut!]'
                || (data.power.main_timeleft > 0
                  && `[${data.power.main_timeleft}s]`)}
            </LabeledList.Item>
            <LabeledList.Item
              label="Backup"
              color={statusBackup.color}
              buttons={(
                <Button
                  icon="lightbulb-o"
                  disabled={!data.power.backup}
                  content="Disrupt"
                  onClick={() => act('disrupt-backup')} />
              )}>
              {data.power.backup ? 'Online' : 'Offline'}
              {' '}
              {(!data.wires.backup_1 || !data.wires.backup_2)
                && '[Wires have been cut!]'
                || (data.power.backup_timeleft > 0
                  && `[${data.power.backup_timeleft}s]`)}
            </LabeledList.Item>
            <LabeledList.Item
              label="Электрофикация"
              color={statusElectrify.color}
              buttons={(
                <Fragment>
                  <Button
                    icon="wrench"
                    disabled={!(data.wires.shock && data.shock === 0)}
                    content="Restore"
                    onClick={() => act('shock-restore')} />
                  <Button
                    icon="bolt"
                    disabled={!data.wires.shock}
                    content="Temporary"
                    onClick={() => act('shock-temp')} />
                  <Button
                    icon="bolt"
                    disabled={!data.wires.shock}
                    content="Permanent"
                    onClick={() => act('shock-perm')} />
                </Fragment>
              )}>
              {data.shock === 2 ? 'Safe' : 'Electrified'}
              {' '}
              {!data.wires.shock
                && '[Wires have been cut!]'
                || (data.shock_timeleft > 0
                  && `[${data.shock_timeleft}s]`)
                || (data.shock_timeleft === -1
                  && '[Permanent]')}
            </LabeledList.Item>
          </LabeledList>
        </Section>
        <Section title="Доступ и контроль">
          <LabeledList>
            <LabeledList.Item
              label="ID Сканер"
              color="bad"
              buttons={(
                <Button
                  icon={data.id_scanner ? 'power-off' : 'times'}
                  content={data.id_scanner ? 'Вкл' : 'Выкл'}
                  selected={data.id_scanner}
                  disabled={!data.wires.id_scanner}
                  onClick={() => act('idscan-toggle')} />
              )}>
              {!data.wires.id_scanner && '[Wires have been cut!]'}
            </LabeledList.Item>
            <LabeledList.Divider />
            <LabeledList.Item
              label="Болты шлюза"
              color="bad"
              buttons={(
                <Button
                  icon={data.locked ? 'lock' : 'unlock'}
                  content={data.locked ? 'Опущены' : 'Подняты'}
                  selected={data.locked}
                  disabled={!data.wires.bolts}
                  onClick={() => act('bolt-toggle')} />
              )}>
              {!data.wires.bolts && '[Провода были перерезаны!]'}
            </LabeledList.Item>
            <LabeledList.Item
              label="Свет шлюза"
              color="bad"
              buttons={(
                <Button
                  icon={data.lights ? 'power-off' : 'times'}
                  content={data.lights ? 'Вкл' : 'Выкл'}
                  selected={data.lights}
                  disabled={!data.wires.lights}
                  onClick={() => act('light-toggle')} />
              )}>
              {!data.wires.lights && '[Провода были перерезаны!]'}
            </LabeledList.Item>
            <LabeledList.Item
              label="Door Force Sensors"
              color="bad"
              buttons={(
                <Button
                  icon={data.safe ? 'power-off' : 'times'}
                  content={data.safe ? 'Вкл' : 'Выкл'}
                  selected={data.safe}
                  disabled={!data.wires.safe}
                  onClick={() => act('safe-toggle')} />
              )}>
              {!data.wires.safe && '[Провода были перерезаны!]'}
            </LabeledList.Item>
            <LabeledList.Item
              label="Door Timing Safety"
              color="bad"
              buttons={(
                <Button
                  icon={data.speed ? 'power-off' : 'times'}
                  content={data.speed ? 'Вкл' : 'Выкл'}
                  selected={data.speed}
                  disabled={!data.wires.timing}
                  onClick={() => act('speed-toggle')} />
              )}>
              {!data.wires.timing && '[Провода были перерезаны!]'}
            </LabeledList.Item>
            <LabeledList.Divider />
            <LabeledList.Item
              label="С"
              color="bad"
              buttons={(
                <Button
                  icon={data.opened ? 'sign-out-alt' : 'sign-in-alt'}
                  content={data.opened ? 'Откр.' : 'Закр.'}
                  selected={data.opened}
                  disabled={(data.locked || data.welded)}
                  onClick={() => act('open-close')} />
              )}>
              {!!(data.locked || data.welded) && (
                <span>
                  [Door is {data.locked ? 'bolted' : ''}
                  {(data.locked && data.welded) ? ' and ' : ''}
                  {data.welded ? 'welded' : ''}!]
                </span>
              )}
            </LabeledList.Item>
          </LabeledList>
        </Section>
      </Window.Content>
    </Window>
  );
};
