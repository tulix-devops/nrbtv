import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nrbtv/src/bloc/epg_cubit/epg_cubit.dart';
import 'package:nrbtv/src/data/models/content/tv_schedule_model.dart';
import 'package:ui_kit/ui_kit.dart';

class HomePhoneDvr extends StatefulWidget {
  const HomePhoneDvr({super.key});

  @override
  State<HomePhoneDvr> createState() => _HomePhoneDvrState();
}

class _HomePhoneDvrState extends State<HomePhoneDvr> {
  String? selectedDay;
  bool isGridView = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EpgCubit, EpgState>(
      builder: (context, state) {
        final Map<String, List<TvScheduleModel>> epgContent =
            state.epgContent ?? {};
        final List<String> availableDays = epgContent.keys.toList();

        if (selectedDay == null && availableDays.isNotEmpty) {
          selectedDay = availableDays.first;
        }

        final List<TvScheduleModel> schedules = epgContent[selectedDay] ?? [];

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 14, bottom: 24, right: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text('Archive', style: TextStyles.h5),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      border: Border.all(
                        color: context.uiColors.primary,
                        width: 2,
                      ),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                                isGridView ? context.uiColors.primary : null),
                          ),
                          icon: Icon(
                            Icons.grid_on,
                            color: isGridView
                                ? context.uiColors.onSurface
                                : context.uiColors.primary,
                          ),
                          onPressed: () {
                            setState(() {
                              isGridView = true;
                            });
                          },
                        ),
                        IconButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                                !isGridView ? context.uiColors.primary : null),
                          ),
                          icon: Icon(
                            Icons.list,
                            color: !isGridView
                                ? context.uiColors.onSurface
                                : context.uiColors.primary,
                          ),
                          onPressed: () {
                            setState(() {
                              isGridView = false;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => _showDatePickerDialog(context, availableDays),
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: context.uiColors.primary,
                          width: 2,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            selectedDay ?? "Select a Date",
                            style: TextStyles.bodyMediumBold,
                          ),
                          const SizedBox(width: 8),
                          Icon(Icons.calendar_today,
                              color: context.uiColors.primary),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 500,
              child: isGridView
                  ? GridView.builder(
                      itemCount: schedules.length,
                      padding: const EdgeInsets.only(bottom: 300),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 12,
                      ),
                      itemBuilder: (context, index) {
                        final schedule = schedules[index];
                        final isSelected = schedule ==
                            context.read<EpgCubit>().state.selectedDvr;
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: _InfoColumnEpg(
                            schedule: schedule,
                            isSelected: isSelected,
                          ),
                        );
                      },
                    )
                  : ListView.builder(
                      itemCount: schedules.length,
                      padding: const EdgeInsets.only(bottom: 100),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        final schedule = schedules[index];
                        final isSelected = schedule ==
                            context.read<EpgCubit>().state.selectedDvr;
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: _InfoRowEpg(
                            schedule: schedule,
                            isSelected: isSelected,
                          ),
                        );
                      },
                    ),
            ),
          ],
        );
      },
    );
  }

  void _showDatePickerDialog(BuildContext context, List<String> availableDays) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Select a Date"),
          content: SizedBox(
            height: 250,
            width: double.maxFinite,
            child: ListView.builder(
              itemCount: availableDays.length,
              itemBuilder: (context, index) {
                final day = availableDays[index];
                return ListTile(
                  title: Text(day),
                  onTap: () {
                    setState(() {
                      selectedDay = day;
                    });
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class _InfoRowEpg extends StatelessWidget {
  final TvScheduleModel schedule;
  final bool isSelected;

  const _InfoRowEpg({required this.schedule, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    const _radius = BorderRadius.all(Radius.circular(12));

    return SizedBox(
      height: 70,
      width: double.infinity,
      child: InkWell(
        borderRadius: _radius,
        onTap: () {
          if (schedule.isFuture) {
            return;
          }
          context.read<EpgCubit>().setCurrentDvr(schedule);
        },
        child: Container(
          padding: const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
              color: isSelected ? context.uiColors.primary : null,
              borderRadius: _radius),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Image.network(
                    schedule.thumbnail,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(Assets.nrbLogo);
                    },
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  schedule.name,
                  style: TextStyles.bodyMediumBold.copyWith(
                    color: schedule.isFuture ? AppColors.greyscale[500]! : null,
                  ),
                ),
              ),
              const SizedBox(width: 18),
              Expanded(
                child: Text(
                  '${schedule.start} - ${schedule.end}',
                  style: TextStyles.bodyMediumBold.copyWith(
                    color: schedule.isFuture ? AppColors.greyscale[500]! : null,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoColumnEpg extends StatelessWidget {
  final TvScheduleModel schedule;
  final bool isSelected;

  const _InfoColumnEpg({required this.schedule, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    const _radius = BorderRadius.all(Radius.circular(12));

    return SizedBox(
      height: 70,
      child: InkWell(
        borderRadius: _radius,
        onTap: () {
          if (schedule.isFuture) {
            return;
          }
          context.read<EpgCubit>().setCurrentDvr(schedule);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          decoration: BoxDecoration(
              color: isSelected ? context.uiColors.primary : null,
              borderRadius: _radius),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
                width: double.infinity,
                child: Image.network(
                  schedule.thumbnail,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(Assets.nrbLogo);
                  },
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Expanded(
                child: Text(
                  schedule.name,
                  textAlign: TextAlign.center,
                  style: TextStyles.bodyMediumBold.copyWith(
                    color: schedule.isFuture ? AppColors.greyscale[500]! : null,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 5),
              Expanded(
                child: Text(
                  '${schedule.start} - ${schedule.end}',
                  style: TextStyles.bodyXSmallBold.copyWith(
                    color: schedule.isFuture ? AppColors.greyscale[500]! : null,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
